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
    private let dailyJokeCacheKey = "com.zigamajig.Punster.dailyJoke"
    private let lastDailyJokeDateCacheKey = "com.zigamajig.Punster.lastDailyJokeDateCacheKey"
    
    init(cacheService: CacheServiceProtocol) {
        self.cacheService = cacheService
    }
    
    func loadDailyJoke() -> Joke? {
        let lastDailyJokeDate = cacheService.loadDouble(for: lastDailyJokeDateCacheKey)
        let lastDate = Date(timeIntervalSince1970: lastDailyJokeDate)
        if lastDate.timeIntervalSinceNow > Constants.Numbers.Time.oneHourInSeconds {
            // Date is older than 24 hours, so we're not going to return anything that was cached
            return nil
        }
        // We're within 24 hours since the last cache, attempt to load it
        guard let jsonData = cacheService.loadData(for: dailyJokeCacheKey) else {
            // No cached daily joke found
            return nil
        }
        // return the cached joke
        let cachedDaily = try? JSONDecoder().decode(Joke.self, from: jsonData)
        return cachedDaily
    }
    
    func saveDailyJoke(_ joke: Joke) throws {
        let jsonData = try JSONEncoder().encode(joke)
        cacheService.save(data: jsonData, for: dailyJokeCacheKey)
        cacheService.save(double: Date().timeIntervalSince1970, for: lastDailyJokeDateCacheKey)
    }
    
    func loadFavorites() throws -> Jokes {
        guard let jsonData = cacheService.loadData(for: favoritesCacheKey) else {
            return []
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
