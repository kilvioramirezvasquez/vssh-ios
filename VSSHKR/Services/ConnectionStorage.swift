//
//  ConnectionStorage.swift
//  VSSHKR
//
//  Storage service for connections using UserDefaults
//  Equivalent to ConnectionStorage.kt in Android
//

import Foundation
import Combine

class ConnectionStorage: ObservableObject {
    private let userDefaults = UserDefaults.standard
    private let connectionsKey = "vssh_connections"
    
    func saveConnection(_ connection: Connection) {
        var connections = getAllConnections()
        
        // Update existing or add new
        if let index = connections.firstIndex(where: { $0.id == connection.id }) {
            connections[index] = connection
        } else {
            connections.append(connection)
        }
        
        saveConnections(connections)
    }
    
    func getAllConnections() -> [Connection] {
        guard let data = userDefaults.data(forKey: connectionsKey),
              let connections = try? JSONDecoder().decode([Connection].self, from: data) else {
            return []
        }
        return connections
    }
    
    func getConnection(id: UUID) -> Connection? {
        return getAllConnections().first { $0.id == id }
    }
    
    func deleteConnection(_ connection: Connection) {
        var connections = getAllConnections()
        connections.removeAll { $0.id == connection.id }
        saveConnections(connections)
    }
    
    private func saveConnections(_ connections: [Connection]) {
        if let data = try? JSONEncoder().encode(connections) {
            userDefaults.set(data, forKey: connectionsKey)
        }
    }
}

