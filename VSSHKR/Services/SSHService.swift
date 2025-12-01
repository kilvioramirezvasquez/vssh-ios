//
//  SSHService.swift
//  VSSHKR
//
//  SSH connection service using NMSSH
//  Equivalent to TerminalActivity.kt in Android
//

import Foundation
import NMSSH

class SSHService: ObservableObject {
    @Published var isConnected: Bool = false
    @Published var terminalOutput: String = ""
    
    private var session: NMSSHSession?
    private var channel: NMSSHChannel?
    private var readTask: Task<Void, Never>?
    
    func connect(connection: Connection) async throws {
        // Create SSH session
        session = NMSSHSession(host: connection.host, port: connection.port, andUsername: connection.username)
        
        guard let session = session else {
            throw SSHError.sessionCreationFailed
        }
        
        // Configure session
        session.timeout = 30
        
        // Connect (NMSSH is synchronous, so we wrap in async)
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            DispatchQueue.global(qos: .userInitiated).async {
                do {
                    try session.connect()
                    if session.isConnected {
                        continuation.resume()
                    } else {
                        continuation.resume(throwing: SSHError.connectionFailed)
                    }
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
        
        // Authenticate
        if !connection.password.isEmpty {
            try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
                DispatchQueue.global(qos: .userInitiated).async {
                    session.authenticate(byPassword: connection.password)
                    if session.isAuthorized {
                        continuation.resume()
                    } else {
                        continuation.resume(throwing: SSHError.authenticationFailed)
                    }
                }
            }
        }
        
        // Get channel
        channel = session.channel
        
        guard let channel = channel else {
            throw SSHError.sessionCreationFailed
        }
        
        // Configure PTY (like Android version)
        let cols = Int(connection.screenWidth) ?? 80
        let rows = Int(connection.screenHeight) ?? 25
        
        // Set terminal type (linux for AcuCOBOL compatibility)
        let terminalType = connection.terminalType.isEmpty ? "linux" : connection.terminalType
        
        // Request PTY with terminal type and size
        // NMSSH API: requestPty(withTerminalType:width:height:error:) returns Bool
        var ptyError: NSError?
        let ptySuccess = channel.requestPty(withTerminalType: terminalType, width: UInt(cols), height: UInt(rows), error: &ptyError)
        
        if !ptySuccess {
            if let error = ptyError {
                throw error
            } else {
                throw SSHError.connectionFailed
            }
        }
        
        // Set TERM environment variable (NMSSH doesn't have setEnvironmentVariable, skip for now)
        // The terminal type is already set via requestPty
        
        // Start shell (NMSSH startShell doesn't take error parameter)
        var shellError: NSError?
        channel.startShell(&shellError)
        
        if let error = shellError {
            throw error
        }
        
        // Start reading from channel
        isConnected = true
        readFromChannel()
    }
    
    private func readFromChannel() {
        guard let channel = channel else { return }
        
        readTask = Task {
            while isConnected && !Task.isCancelled {
                // NMSSH read is blocking, so we use async
                let data = await withCheckedContinuation { (continuation: CheckedContinuation<Data?, Never>) in
                    DispatchQueue.global(qos: .userInitiated).async {
                        // NMSSH channel.read() returns Data? (not readData)
                        var error: NSError?
                        let result = channel.read(&error)
                        continuation.resume(returning: result)
                    }
                }
                
                if let data = data, !data.isEmpty {
                    let text = String(data: data, encoding: .utf8) ?? ""
                    let cleaned = AnsiFilter.stripAnsi(text)
                    
                    await MainActor.run {
                        terminalOutput += cleaned
                    }
                }
                
                // Small delay to avoid tight loop
                try? await Task.sleep(nanoseconds: 50_000_000) // 50ms
            }
        }
    }
    
    func sendCommand(_ command: String) throws {
        guard let channel = channel, isConnected else {
            throw SSHError.notConnected
        }
        
        let data = (command + "\r\n").data(using: .utf8) ?? Data()
        var error: NSError?
        let timeout = NSNumber(value: 30) // 30 second timeout
        let success = channel.write(data, error: &error, timeout: timeout)
        
        if !success, let writeError = error {
            throw writeError
        }
    }
    
    func sendCharacter(_ character: String) throws {
        guard let channel = channel, isConnected else {
            throw SSHError.notConnected
        }
        
        let data = character.data(using: .utf8) ?? Data()
        var error: NSError?
        let timeout = NSNumber(value: 30) // 30 second timeout
        let success = channel.write(data, error: &error, timeout: timeout)
        
        if !success, let writeError = error {
            throw writeError
        }
    }
    
    func disconnect() {
        isConnected = false
        readTask?.cancel()
        channel?.closeShell()
        session?.disconnect()
    }
}

enum SSHError: Error {
    case sessionCreationFailed
    case authenticationFailed
    case notConnected
    case connectionFailed
}
