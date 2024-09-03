//
//  FeedViewModel.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

enum FeedViewType {
    case feed
    case favorite
}

@MainActor final class FeedViewModel: ObservableObject {
    
    // !! - FeedJoke is used instead of just Joke because we need to observe the joke, its random color scheme, AND whether or not it's favorited
    @Published var feedJokes = FeedJokes()
    @Published var isAlertVisible = false
    @Published var alertInfo = AlertInfo()
    private(set) var feedViewType: FeedViewType
    
    private var jokeRepository: JokeRepositoryProtocol
    
    init(feedViewType: FeedViewType,
         jokeRepository: JokeRepositoryProtocol = DependencyContainer.shared.resolve(JokeRepositoryProtocol.self)) {
        self.feedViewType = feedViewType
        self.jokeRepository = jokeRepository
    }
    
    func loadData() async {
        do {
            // Load color schemes
            let allColorSchemes = ColorScheme.allCases.shuffled()
            // Load favorites
            let favorites = try jokeRepository.loadFavorites()
            // Create a list of Feed jokes from either loaded jokes or favorites (depending on feedViewType),
            // with a random color scheme, and set their favorite value
            feedJokes = []
            if feedViewType == .feed {
                // Load jokes from API
                let loadedJokes = try await jokeRepository.fetchJokes(quantity: 10)
                feedJokes = []
                for (index, joke) in loadedJokes.enumerated() {
                    feedJokes.append(.init(joke: joke,
                                           isFavorite: favorites.contains(where: {$0.id == joke.id}),
                                           colorScheme: allColorSchemes[index % allColorSchemes.count]))
                }
            } else {
                for (index, joke) in favorites.enumerated() {
                    feedJokes.append(.init(joke: joke,
                                           isFavorite: true,
                                           colorScheme: allColorSchemes[index % allColorSchemes.count]))
                }
            }
        } catch {
            handleError(error)
        }
    }
    
    func handleError(_ error: Error) {
        alertInfo = AlertInfo(title: Constants.Strings.Shared.uhoh,
                              message: "\(Constants.Strings.Shared.errorOccurred) \(Constants.Strings.Shared.reasonColon) \(error)")
        isAlertVisible = true
    }
    
    func toggleFavoriteJoke(at index: Int) {
        let feedJoke = feedJokes[index]
        do {
            if feedJoke.isFavorite {
                try jokeRepository.removeFavorite(joke: feedJoke.joke)
            } else {
                try jokeRepository.addFavorite(joke: feedJoke.joke)
            }
            
            feedJokes[index].isFavorite.toggle()
            
            if feedViewType == .favorite {
                feedJokes.remove(at: index)
            }
        } catch {
            print("Failed to update favorite.")
        }
    }
    
}
