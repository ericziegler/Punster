//
//  FeedViewModel.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

@MainActor final class FeedViewModel: ObservableObject {
    
    @Published var jokes = Jokes()
    @Published var isAlertVisible = false
    @Published var alertInfo = AlertInfo()
    
    private var jokeRepository: JokeRepositoryProtocol
    
    init(jokeRepository: JokeRepositoryProtocol = DependencyContainer.shared.resolve(JokeRepositoryProtocol.self)) {
        self.jokeRepository = jokeRepository
    }
    
    func loadData() async {
        // TODO: EZ - Put back
        jokes = Joke.mockArray
        return
        do {
            jokes = try await jokeRepository.fetchJokes(quantity: 10)
        } catch {
            handleError(error)
        }
    }
    
    func handleError(_ error: Error) {
        alertInfo = AlertInfo(title: Constants.Strings.Shared.uhoh,
                              message: "\(Constants.Strings.Shared.errorOccurred) \(Constants.Strings.Shared.reasonColon) \(error)")
        isAlertVisible = true
    }
    
}
