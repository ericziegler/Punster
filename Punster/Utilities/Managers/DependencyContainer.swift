//
//  DependencyContainer.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation
import Swinject

// !! - A slightly different approach to DependencyContainer than we currently use.
//      This registers and resolves abstract protocols as opposed to concrete classes.
//      This does two things:
//      1. Makes us slightly less prone to errors/crashes
//      2. Lets us swap out for testing data (which I haven't included here).
final class DependencyContainer {
    
    static let shared = DependencyContainer()
    
    private let container: Container
    
    private init() {
        container = Container()
        registerServices()
    }
    
    private func registerServices() {
        
        // MARK: - Service Helper Registrations
        
        container.register(CacheServiceProtocol.self) { _ in
            CacheService()
        }.inObjectScope(.container)
        
        container.register(NetworkServiceProtocol.self) { resolver in
            let baseURL = "https://v2.jokeapi.dev/joke"
            return NetworkService(baseURL: baseURL)
        }.inObjectScope(.container)
        
        // MARK: - DAO Registrations
        
        container.register(JokeDAOProtocol.self) { resolver in
            let cacheService = resolver.resolve(CacheServiceProtocol.self)!
            return JokeDAO(cacheService: cacheService)
        }.inObjectScope(.container)
        
        container.register(UserDAOProtocol.self) { resolver in
            let cacheService = resolver.resolve(CacheServiceProtocol.self)!
            return UserDAO(cacheService: cacheService)
        }.inObjectScope(.container)

        // MARK: - Service Registrations
        
        container.register(JokeServiceProtocol.self) { resolver in
            let networkService = resolver.resolve(NetworkServiceProtocol.self)!
            return JokeService(networkService: networkService)
        }.inObjectScope(.container) // Singleton scope
  
        // MARK: - Registration Registrations
        
        container.register(JokeRepositoryProtocol.self) { resolver in
            let jokeDAO = resolver.resolve(JokeDAOProtocol.self)!
            let jokeService = resolver.resolve(JokeServiceProtocol.self)!
            return JokeRepository(service: jokeService,
                                  dao: jokeDAO)
        }.inObjectScope(.container)
        
        container.register(UserRepositoryProtocol.self) { resolver in
            let userDAO = resolver.resolve(UserDAOProtocol.self)!
            return UserRepository(dao: userDAO)
        }.inObjectScope(.container)
    }
    
    func resolve<Service>(_ serviceType: Service.Type) -> Service {
        guard let service = container.resolve(serviceType) else {
            fatalError("Service of type \(serviceType) has not been registered.")
        }
        return service
    }
}
