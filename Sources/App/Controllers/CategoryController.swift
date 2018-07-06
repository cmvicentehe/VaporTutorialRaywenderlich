//
//  CategoryController.swift
//  App
//
//  Created by Carlos Vicente on 5/7/18.
//

import Vapor

struct CategoryController: RouteCollection {
    func boot(router: Router) throws {
        let collection = router.grouped("api", "category")
        collection.post(use: create)
        collection.get(use: getAll)
        collection.get(Category.parameter, use: get)
        collection.get(Category.parameter, "acronyms",  use: getAcronyms)
    }
    
    func create(_ req: Request) throws -> Future<Category> {
        let category = try req.content.decode(Category.self)
        return category.save(on: req)
    }
    
    func getAll(_ req: Request) throws -> Future<[Category]> {
        return Category.query(on: req).all()
    }

    func get(_ req: Request) throws -> Future<Category> {
        return try req.parameters.next(Category.self)
    }
    
    func getAcronyms(_ req: Request) throws -> Future<[Acronym]> {
        return try req.parameters.next(Category.self).flatMap(to: [Acronym].self) { category in
            return try category.acronyms.query(on: req).all()
        }
    }
}
