//
//  TerminalView.swift
//  VSSHKR
//
//  Terminal view for SSH session
//  Ported from TerminalActivity.kt in Android
//

import SwiftUI

struct TerminalView: View {
    @StateObject private var sshService = SSHService()
    @State private var inputText: String = ""
    @State private var connection: Connection
    
    init(connection: Connection) {
        _connection = State(initialValue: connection)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Terminal output area
            ScrollView {
                ScrollViewReader { proxy in
                    Text(sshService.terminalOutput)
                        .font(.system(.body, design: .monospaced))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(8)
                        .background(Color.black)
                        .id("bottom")
                        .onChange(of: sshService.terminalOutput) { _ in
                            withAnimation {
                                proxy.scrollTo("bottom", anchor: .bottom)
                            }
                        }
                }
            }
            .background(Color.black)
            
            // Input area
            HStack {
                TextField("Type here (characters sent in real-time)...", text: $inputText)
                    .font(.system(.body, design: .monospaced))
                    .foregroundColor(.green)
                    .padding(8)
                    .background(Color(white: 0.1))
                    .onChange(of: inputText) { newValue in
                        // Send characters in real-time (like vssh.apk)
                        if newValue.count > inputText.count {
                            let newChars = String(newValue.suffix(newValue.count - inputText.count))
                            try? sshService.sendCharacter(newChars)
                        }
                    }
                    .onSubmit {
                        // Send Enter
                        try? sshService.sendCommand("")
                        inputText = ""
                    }
            }
            .background(Color(white: 0.1))
        }
        .navigationTitle(connection.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            Task {
                do {
                    try await sshService.connect(connection: connection)
                } catch {
                    print("Connection error: \(error)")
                }
            }
        }
        .onDisappear {
            sshService.disconnect()
        }
    }
}

