//
//  Category.swift
//  App
//
//  Created by Carlos Vicente on 5/7/18.
//

import Foundation
import Vapor
import FluentSQLite

struct Category: Codable {
    var id: Int?
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

extension Category: Migration {}
extension Category: SQLiteModel {}
extension Category: Content {}
extension Category: Parameter {}

extension Category {
    var acronyms: Siblings<Category, Acronym, AcronymCategoryPivot> {
        return siblings()
    }
}
