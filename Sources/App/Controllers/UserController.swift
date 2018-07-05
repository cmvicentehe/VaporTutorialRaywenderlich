//
//  UserController.swift
//  App
//
//  Created by Carlos Vicente on 5/7/18.
//

import Vapor

struct UserController: RouteCollection {
    func boot(router: Router) throws {
        let collection = router.grouped("api", "user")
        collection.post(use: create)
        collection.get(use: getAll)
        collection.get(User.parameter, use: get)
        collection.get(User.parameter, "acronyms", use: getAcronyms)
    }
    
    func create(_ req: Request) throws -> Future<User> {
        let user = try req.content.decode(User.self)
        return user.save(on: req)
    }
    
    func getAll(_ req: Request) throws -> Future<[User]> {
        return User.query(on: req).all()
    }
    
    func get(_ req: Request) throws -> Future<User> {
        return try req.parameters.next(User.self)
    }
    
    func getAcronyms(_ req: Request) throws -> Future<[Acronym]> {
        return try req.parameters.next(User.self).flatMap(to: [Acronym].self) { user in
            return try user.acronyms.query(on: req).all()
        }
    }
}
