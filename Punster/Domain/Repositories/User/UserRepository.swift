//
//  UserRepository.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

final class UserRepository: UserRepositoryProtocol {
    
    private(set) var dao: UserDAOProtocol
    var isUserLoggedIn: Bool {
        dao.isUserLoggedIn
    }
    
    init(dao: UserDAOProtocol) {
        self.dao = dao
    }
    
    func login() {
        dao.login()
    }
    
    func logout() {
        dao.logout()
    }
}
