//
//  JokeRepository.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

final class JokeRepository: JokeRepositoryProtocol {
    
    private(set) var service: JokeServiceProtocol
    private(set) var dao: JokeDAOProtocol
    
    init(service: JokeServiceProtocol,
         dao: JokeDAOProtocol) {
        self.service = service
        self.dao = dao
    }
    
    func fetchJokes(quantity: Int) async throws -> Jokes {
        return try await service.fetchJokes(quantity: quantity)
    }
    
    func loadFavorites() throws -> Jokes {
        return try dao.loadFavorites()
    }
    
    func addFavorite(joke: Joke) throws {
        try dao.addFavorite(joke: joke)
    }
    
    func removeFavorite(joke: Joke) throws {
        try dao.removeFavorite(joke: joke)
    }
    
}
