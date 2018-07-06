//
//  AcronymCategoryPivot.swift
//  App
//
//  Created by Carlos Vicente on 6/7/18.
//

import Foundation

import FluentSQLite
import Vapor

struct AcronymCategoryPivot: SQLitePivot {
    
    var id: Int?
    let acronymID: Acronym.ID
    let categoryID: Category.ID
    
    typealias Left = Acronym
    typealias Right = Category
    
    static var leftIDKey: WritableKeyPath<AcronymCategoryPivot, Int> = \AcronymCategoryPivot.acronymID as! WritableKeyPath<AcronymCategoryPivot, Int>
    static var rightIDKey: WritableKeyPath<AcronymCategoryPivot, Int> = \AcronymCategoryPivot.categoryID as! WritableKeyPath<AcronymCategoryPivot, Int>
    
    init(_ acronymID: Acronym.ID, categoryID: Category.ID) {
        self.acronymID = acronymID
        self.categoryID = categoryID
    }
}

extension AcronymCategoryPivot: Migration {}

