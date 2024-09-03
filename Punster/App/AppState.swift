//
//  AppState.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

final class AppState: ObservableObject {
    
    @Published var isUserLoggedIn: Bool
    
    private var userRepo: UserRepositoryProtocol
    
    init(userRepo: UserRepositoryProtocol = DependencyContainer.shared.resolve(UserRepositoryProtocol.self)) {
        self.userRepo = userRepo
        isUserLoggedIn = userRepo.isUserLoggedIn
    }
    
    func login() {
        userRepo.login()
        isUserLoggedIn = userRepo.isUserLoggedIn
    }
}
