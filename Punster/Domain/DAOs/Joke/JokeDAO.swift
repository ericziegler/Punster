//
//  JokeDAO.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

final class JokeDAO: JokeDAOProtocol {
    
    private let cacheService: CacheServiceProtocol
    private let favoritesCacheKey = "com.zigamajig.Punster.favorites"
    
    init(cacheService: CacheServiceProtocol) {
        self.cacheService = cacheService
    }
    
    func loadFavorites() throws -> Jokes {
        guard let jsonData = cacheService.loadData(for: favoritesCacheKey) else {
            throw CacheError.notFound
        }
        let favorites = try JSONDecoder().decode(Jokes.self, from: jsonData)
        return favorites
    }
    
    func saveFavorites(jokes: Jokes) throws {
        let jsonData = try JSONEncoder().encode(jokes)
        cacheService.save(data: jsonData,
                          for: favoritesCacheKey)
    }
    
    func addFavorite(joke: Joke) throws {
        var cachedFavorites = Jokes()
        if let foundFavorites = try? loadFavorites() {
            cachedFavorites = foundFavorites
        }
        
        guard !cachedFavorites.contains(where: { $0.id == joke.id }) else {
            // Joke already exists in favorites. Do not add again.
            return
        }
        // Add the joke to favorites and save it
        cachedFavorites.append(joke)
        try saveFavorites(jokes: cachedFavorites)
    }
    
    func removeFavorite(joke: Joke) throws {
        var favorites = try loadFavorites()
        // Filter out the joke with the matching id
        favorites.removeAll { $0.id == joke.id }
        // Save the updated favorites list
        try saveFavorites(jokes: favorites)
    }
}
