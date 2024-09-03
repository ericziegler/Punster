//
//  HomeViewModel.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import SwiftUI

@MainActor final class HomeViewModel: ObservableObject {
    
    @Published var dailyJoke: FeedJoke?
    @Published var isAlertVisible = false
    @Published var alertInfo = AlertInfo()
    @Published var currentDate: String = ""
    // !! - If we need to bind an optional to something like a boolean, we can do it like this,
    //      where if the property is nil, the value is false. NOTE: This could probably be moved
    //      into some sort of extension or more global area of the app.
    var isFavoriteBinding: Binding<Bool> {
        Binding<Bool>(
            get: { self.dailyJoke?.isFavorite ?? false },
            set: { self.dailyJoke?.isFavorite = $0 }
        )
    }
    
    private var jokeRepository: JokeRepositoryProtocol
    private let dateFormatter = DateFormatter()
    
    init(jokeRepository: JokeRepositoryProtocol = DependencyContainer.shared.resolve(JokeRepositoryProtocol.self)) {
        self.jokeRepository = jokeRepository
        setupDateFormatter()
    }
    
    private func setupDateFormatter() {
        dateFormatter.dateFormat = "MMM d, yyyy"
    }
    
    func loadData() async {
        do {
            // Get the daily joke
            let joke = try await jokeRepository.fetchDailyJoke()
            // Load favorites to determine whether the joke is in the list
            let favorites = try jokeRepository.loadFavorites()
            // Create the FeedJoke to be used by the UI
            dailyJoke = FeedJoke(joke: joke,
                                 isFavorite: favorites.contains(where: {$0.id == joke.id}),
                                 colorScheme: ColorScheme.allCases.shuffled().first ?? .pineGreen)
            currentDate = dateFormatter.string(from: Date())
        } catch {
            handleError(error)
        }
    }
    
    func handleError(_ error: Error) {
        alertInfo = AlertInfo(title: Constants.Strings.Shared.uhoh,
                              message: "\(Constants.Strings.Shared.errorOccurred) \(Constants.Strings.Shared.reasonColon) \(error)")
        isAlertVisible = true
    }
    
    func toggleFavoriteJoke() {
        guard let dailyJoke = dailyJoke else {
            return
        }
        
        do {
            if dailyJoke.isFavorite {
                try jokeRepository.removeFavorite(joke: dailyJoke.joke)
            } else {
                try jokeRepository.addFavorite(joke: dailyJoke.joke)
            }
            
            self.dailyJoke?.isFavorite.toggle()
        } catch {
            print("Failed to update favorite.")
        }
    }
    
}
