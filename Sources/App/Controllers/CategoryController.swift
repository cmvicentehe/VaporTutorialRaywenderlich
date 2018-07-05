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
}
