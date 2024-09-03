//
//  UserRepository.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

final class UserRepository: UserRepositoryProtocol {
    
    private(set) var dao: UserDAOProtocol
    private(set) var isUserLoggedIn: Bool
    
    init(dao: UserDAOProtocol) {
        self.dao = dao
        self.isUserLoggedIn = dao.isUserLoggedIn
    }
    
    func login() {
        dao.login()
    }
    
    func logout() {
        dao.logout()
    }
}
