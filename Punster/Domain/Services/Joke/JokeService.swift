//
//  JokeService.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

final class JokeService: JokeServiceProtocol {
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchDailyJoke() async throws -> Joke {
        let endpoint = "/Pun"
        let parameters = [
            "blackListFlags": "nsfw,religious,political,racist,sexist,explicit",
            "amount": "1"
        ]
        
        let jsonData = try await networkService.request(endpoint: endpoint,
                                                        parameters: parameters)
        
        
        let joke = try JSONDecoder().decode(Joke.self, from: jsonData)
        return joke
    }
    
    func fetchJokes(quantity: Int = 10) async throws -> Jokes {
        let endpoint = "/Pun"
        let parameters = [
            "blackListFlags": "nsfw,religious,political,racist,sexist,explicit",
            "amount": String(quantity)
        ]
        
        let jsonData = try await networkService.request(endpoint: endpoint,
                                                        parameters: parameters)
        
        
        let jokeResult = try JSONDecoder().decode(JokeResult.self, from: jsonData)
        let jokes = jokeResult.jokes
        return jokes
    }
}
