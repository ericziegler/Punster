//
//  JokeResult.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

// !! - The data comes back from this Joke API as a "result" containing multiple things.
//      To simplify parsin, we have a model to match that here, but we really only care
//      about the Jokes inside.
struct JokeResult: Codable {
    let error: Bool
    let amount: Int
    let jokes: Jokes    
}
