//
//  Extensions.swift
//  ToDoList
//
//  Created by Richard Kim on 14/10/2024.
//

import Foundation

extension Encodable {
    func asDIctionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
