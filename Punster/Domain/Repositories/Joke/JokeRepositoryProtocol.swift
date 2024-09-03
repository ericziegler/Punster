//
//  JokeRepositoryProtocol.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

protocol JokeRepositoryProtocol {
    var service: JokeServiceProtocol { get }
    var dao: JokeDAOProtocol { get }
    
    func fetchJokes(quantity: Int) async throws -> Jokes
    func loadFavorites() throws -> Jokes
    func addFavorite(joke: Joke) throws
    func removeFavorite(joke: Joke) throws
}
