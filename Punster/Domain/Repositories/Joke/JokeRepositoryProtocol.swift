//
//  JokeRepositoryProtocol.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

// !! - The general architecture is as follows:
//      A REPOSITORY can contain a SERVICE and a DAO. These three pieces are specific to a
//      specific feature. (In this case - Jokes.)
//          - The SERVICE will talk to the NETWORK SERVICE, which makes the API requests.
//          - The DAO will talk to the CACHE SERVICE, which persists the data locally
//      NETWORK SERVICE and CACHE SERVICE are intended to be more generic, and work with a
//      specific technology.
protocol JokeRepositoryProtocol {
    var service: JokeServiceProtocol { get }
    var dao: JokeDAOProtocol { get }
    
    func fetchDailyJoke() async throws -> Joke
    func fetchJokes(quantity: Int) async throws -> Jokes
    func loadFavorites() throws -> Jokes
    func addFavorite(joke: Joke) throws
    func removeFavorite(joke: Joke) throws
}
