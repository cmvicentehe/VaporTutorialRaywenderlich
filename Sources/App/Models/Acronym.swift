//
//  Acronym.swift
//  App
//
//  Created by Carlos Vicente on 2/7/18.
//

import FluentSQLite
import Vapor

final class Acronym: Codable {
    var id: Int?
    var short: String
    var long: String
    var creatorId: User.ID
    
    init(short: String, long: String, creatorId: User.ID) {
        self.short = short
        self.long = long
        self.creatorId = creatorId
    }
}
/*
 * MODEL
 */
//extension Acronym: Model {
//    typealias Database = SQLiteDatabase
//    typealias ID = Int
//    static let idKey: IDKey = \Acronym.id
//}

extension Acronym: SQLiteModel {}
extension Acronym: Content {}
extension Acronym: Migration {}
extension Acronym: Parameter {}

extension Acronym {
    var creator: Parent<Acronym, User> {
        return parent(\.creatorId)
    }
}
