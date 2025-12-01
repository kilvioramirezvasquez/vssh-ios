//
//  ConnectionEditView.swift
//  VSSHKR
//
//  View for editing connection settings
//  Ported from ConnectionActivity.kt in Android
//

import SwiftUI

struct ConnectionEditView: View {
    @State var connection: Connection
    let onSave: (Connection) -> Void
    @Environment(\.dismiss) var dismiss
    
    let terminalTypes = ["linux", "xterm", "xterm-256color", "vt100"]
    let backspaceOptions = ["Ctrl-?(127)", "Ctrl-H(8)", "ASCII DEL(127)"]
    let functionKeysOptions = ["Linux", "Xterm", "VT100", "Esc[h~"]
    
    var body: some View {
        NavigationView {
            Form {
                Section("Basic Settings") {
                    TextField("Name", text: $connection.name)
                    TextField("Host", text: $connection.host)
                        .keyboardType(.URL)
                        .autocapitalization(.none)
                    TextField("Port", value: $connection.port, format: .number)
                        .keyboardType(.numberPad)
                    TextField("Username", text: $connection.username)
                        .autocapitalization(.none)
                    SecureField("Password", text: $connection.password)
                }
                
                Section("Terminal Settings") {
                    Picker("Terminal Type", selection: $connection.terminalType) {
                        ForEach(terminalTypes, id: \.self) { type in
                            Text(type).tag(type)
                        }
                    }
                    
                    TextField("Screen Width", text: $connection.screenWidth)
                        .keyboardType(.numberPad)
                    TextField("Screen Height", text: $connection.screenHeight)
                        .keyboardType(.numberPad)
                    
                    Picker("Backspace", selection: $connection.backspace) {
                        ForEach(backspaceOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    
                    Picker("Function Keys", selection: $connection.functionKeys) {
                        ForEach(functionKeysOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                }
                
                Section("Advanced") {
                    Toggle("Autoconnect", isOn: $connection.autoconnect)
                    Toggle("No Shell", isOn: $connection.noShell)
                    Toggle("Key Forwarding", isOn: $connection.keyForwarding)
                }
            }
            .navigationTitle("Connection")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        onSave(connection)
                        dismiss()
                    }
                    .disabled(connection.name.isEmpty || connection.host.isEmpty)
                }
            }
        }
    }
}

