//
//  AppState.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

// !! - We typically want ObservableObjects to be declared as final. This makes it so that you can't subclass.
//      Subclassing ObservableObjects can lead to hard-to-follow code.
final class AppState: ObservableObject {
    
    @Published var isUserLoggedIn: Bool
    
    private var userRepo: UserRepositoryProtocol
    
    // !! - A common init pattern for ObservableObjects is to create an initializer, injecting data sources.
    //      The data sources injected typically default to a resolved object from DependencyContainer.
    init(userRepo: UserRepositoryProtocol = DependencyContainer.shared.resolve(UserRepositoryProtocol.self)) {
        self.userRepo = userRepo
        isUserLoggedIn = userRepo.isUserLoggedIn
    }
    
    func login() {
        userRepo.login()
        isUserLoggedIn = userRepo.isUserLoggedIn
    }
}
