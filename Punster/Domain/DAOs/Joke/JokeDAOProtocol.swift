//
//  JokeDAOProtocol.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

protocol JokeDAOProtocol {
    func loadDailyJoke() -> Joke?
    func saveDailyJoke(_ joke: Joke) throws
    func loadFavorites() throws -> Jokes
    func saveFavorites(jokes: Jokes) throws
    func addFavorite(joke: Joke) throws
    func removeFavorite(joke: Joke) throws
}
