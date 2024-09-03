//
//  Joke.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

typealias Jokes = [Joke]

struct Joke: Hashable, Codable {
    
    // MARK: - Properties
    
    let id: Int
    let type: JokeType
    /// If the JokeType is "single", this will be the "joke".
    /// If the JokeType is "twopart", this will be the "delivery".
    let text: String
    /// If the JokeType is "single", this will be nil.
    /// If the JokeType is "twopart", this will be the "setup"
    let setupText: String?
    
    // MARK: - Init
    
    init(id: Int,
         text: String,
         setupText: String? = nil) {
        self.id = id
        self.text = text
        self.setupText = setupText
        self.type = (setupText == nil) ? .single : .twoPart
    }
}

// MARK: - Coding

extension Joke {
    enum CodingKeys: String, CodingKey {
        case id, type, joke, setup, delivery
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        type = try container.decode(JokeType.self, forKey: .type)
        
        // See documentation for `text` and `setupText`
        switch type {
        case .single:
            text = try container.decode(String.self, forKey: .joke)
            setupText = nil
        case .twoPart:
            text = try container.decode(String.self, forKey: .setup)
            setupText = try container.decode(String.self, forKey: .delivery)
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(type, forKey: .type)
        
        // See documentation for `text` and `setupText`
        switch type {
        case .single:
            try container.encode(text, forKey: .joke)
        case .twoPart:
            try container.encode(text, forKey: .setup)
            if let setupText = setupText {
                try container.encode(setupText, forKey: .delivery)
            }
        }
    }
}

// MARK: - Mock Data

extension Joke {
    static func mockData(isSingle: Bool = true) -> Joke {
        if isSingle {
            return Joke(id: 185,
                        text: "Two fish in a tank. One turns to the other and says, \"Do you know how to drive this thing?\"")
        } else {
            return Joke(id: 65,
                        text: "Did you hear about the cheese factory that exploded in France?",
                        setupText: "There was nothing but de brie.")
        }
    }
    
    static var mockArray: Jokes {
        [
            mockData(),
            mockData(isSingle: false),
            Joke(id: 130,
                 text: "What do you call a pile of kittens?",
                 setupText: "A meowntain."),
            Joke(id: 200,
                 text: "Today, my son asked \"Can I have a book mark?\" and I burst into tears.\n11 years old and he still doesn't know my name is Brian."),
            Joke(id: 140,
                 text: "What kind of doctor is Dr. Pepper?",
                 setupText: "He's a fizzician.")
        ]
    }
}
