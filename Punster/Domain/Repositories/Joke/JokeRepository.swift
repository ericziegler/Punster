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
    
}
