//
//  Connection.swift
//  VSSHKR
//
//  Model for SSH connection configuration
//  Ported from Android Kotlin version
//

import Foundation

struct Connection: Codable, Identifiable {
    var id: UUID = UUID()
    var name: String = ""
    var `protocol`: String = "SSH"
    var host: String = ""
    var port: Int = 22
    var username: String = ""
    var password: String = ""
    var autoconnect: Bool = false
    var noShell: Bool = false
    var privateKey: String? = nil
    var keyForwarding: Bool = false
    var portForwardings: [PortForwarding] = []
    var screenWidth: String = "80"
    var screenHeight: String = "25"
    var backspace: String = "Ctrl-?(127)"
    var homeEnd: String = "Standard"
    var functionKeys: String = "Linux"
    var terminalType: String = "linux"
    var characterSet: String = ""
    var autorunUrl: String = ""
    var autorunScript: String = ""
}

struct PortForwarding: Codable, Identifiable {
    var id: UUID = UUID()
    var connectionId: UUID
    var type: String = "Local" // Local, Remote, Dynamic
    var sourcePort: Int = 0
    var destinationHost: String = ""
    var destinationPort: Int = 0
}

struct Macro: Codable, Identifiable {
    var id: UUID = UUID()
    var name: String = ""
    var command: String = ""
}

struct Key: Codable, Identifiable {
    var id: UUID = UUID()
    var name: String = ""
    var keyData: String = ""
    var passphrase: String = ""
}

