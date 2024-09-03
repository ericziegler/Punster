//
//  FeedViewModel.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

@MainActor final class FeedViewModel: ObservableObject {
    
    @Published var feedJokes = FeedJokes()
    @Published var isAlertVisible = false
    @Published var alertInfo = AlertInfo()
    
    private var jokeRepository: JokeRepositoryProtocol
    
    init(jokeRepository: JokeRepositoryProtocol = DependencyContainer.shared.resolve(JokeRepositoryProtocol.self)) {
        self.jokeRepository = jokeRepository
    }
    
    func loadData() async {
        do {
            // Load jokes from API
            // TODO: EZ - Put back
            let loadedJokes = Joke.mockArray//try await jokeRepository.fetchJokes(quantity: 10)
            // Load color schemes
            let allColorSchemes = ColorScheme.allCases.shuffled()
            // Load favorites
            let favorites = try jokeRepository.loadFavorites()
            // Create a list of Feed jokes from the loaded jokes, with a random color scheme, and set their favorite value
            feedJokes = []
            for (index, joke) in loadedJokes.enumerated() {
                feedJokes.append(.init(joke: joke,
                                       isFavorite: favorites.contains(where: {$0.id == joke.id}),
                                       colorScheme: allColorSchemes[index % allColorSchemes.count]))
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
        } catch {
            print("Failed to update favorite.")
        }
    }
    
}
