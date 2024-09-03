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
}
