import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    let acronymsController = AcronymsController()
    let userController = UserController()
    let categoryController = CategoryController()
    try router.register(collection: acronymsController)
    try router.register(collection: userController)
    try router.register(collection: categoryController)
}
