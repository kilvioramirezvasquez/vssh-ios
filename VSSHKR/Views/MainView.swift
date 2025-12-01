//
//  MainView.swift
//  VSSHKR
//
//  Main view with tabs (Connections, Macros, Keys)
//  Ported from MainActivity.kt in Android
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0
    @StateObject private var connectionStorage = ConnectionStorage()
    @State private var connections: [Connection] = []
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ConnectionsView(connections: $connections)
                .tabItem {
                    Label("CONNECTIONS", systemImage: "server.rack")
                }
                .tag(0)
            
            MacrosView()
                .tabItem {
                    Label("MACROS", systemImage: "list.bullet.rectangle")
                }
                .tag(1)
            
            KeysView()
                .tabItem {
                    Label("KEY", systemImage: "key")
                }
                .tag(2)
        }
        .onAppear {
            connections = connectionStorage.getAllConnections()
        }
    }
}

struct ConnectionsView: View {
    @Binding var connections: [Connection]
    @StateObject private var connectionStorage = ConnectionStorage()
    @State private var showingAddConnection = false
    
    var body: some View {
        NavigationView {
            List {
                Section("Bookmarks") {
                    ForEach(connections) { connection in
                        NavigationLink(destination: TerminalView(connection: connection)) {
                            VStack(alignment: .leading) {
                                Text(connection.name)
                                    .font(.headline)
                                Text("ssh://\(connection.username)@\(connection.host):\(connection.port)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            connectionStorage.deleteConnection(connections[index])
                        }
                        connections = connectionStorage.getAllConnections()
                    }
                }
                
                Section("Sessions") {
                    Text("No active sessions")
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("VSSH-KR")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddConnection = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddConnection) {
                ConnectionEditView(connection: Connection()) { connection in
                    connectionStorage.saveConnection(connection)
                    connections = connectionStorage.getAllConnections()
                }
            }
        }
    }
}

struct MacrosView: View {
    var body: some View {
        NavigationView {
            Text("Macros - Coming soon")
                .navigationTitle("MACROS")
        }
    }
}

struct KeysView: View {
    var body: some View {
        NavigationView {
            Text("Keys - Coming soon")
                .navigationTitle("KEY")
        }
    }
}

