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
    
    func fetchJokes(quantity: Int = 10) async throws -> Jokes {
        let endpoint = "/Pun"
        let parameters = [
            "blackListFlags": "nsfw,religious,political,racist,sexist,explici",
            "amount": String(quantity)
        ]
        
        let jsonData = try await networkService.request(endpoint: endpoint,
                                                        parameters: parameters)
        
        
        let jokes = try JSONDecoder().decode(Jokes.self, from: jsonData)
        return jokes
    }
}
