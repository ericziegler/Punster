//
//  FeedJoke.swift
//  Punster
//
//  Created by Eric Ziegler on 9/3/24.
//

import Foundation

typealias FeedJokes = [FeedJoke]

struct FeedJoke {
    let joke: Joke
    var isFavorite: Bool
    let colorScheme: ColorScheme
}
