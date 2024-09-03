//
//  JokeResult.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

struct JokeResult: Codable {
    let error: Bool
    let amount: Int
    let jokes: Jokes    
}
