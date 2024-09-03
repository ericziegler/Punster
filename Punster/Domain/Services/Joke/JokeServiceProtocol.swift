//
//  JokeServiceProtocol.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

protocol JokeServiceProtocol {
    func fetchDailyJoke() async throws -> Joke
    func fetchJokes(quantity: Int) async throws -> Jokes
}
