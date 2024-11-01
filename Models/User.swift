//
//  User.swift
//  ToDoList
//
//  Created by Richard Kim on 12/10/2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
