//
//  User.swift
//  App
//
//  Created by Carlos Vicente on 5/7/18.
//

import Vapor
import FluentSQLite

struct User: Codable {
    var id: UUID?
    let name: String
    let username: String
    
    init(name: String, username: String) {
        self.name = name
        self.username = username
    }
}

extension User: SQLiteUUIDModel {}
extension User: Migration {}
extension User: Content {}
extension User: Parameter {}

extension User {
    var acronyms: Children<User, Acronym> {
        return children(\.creatorId)
    }
}
