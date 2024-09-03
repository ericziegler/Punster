//
//  UserRepositoryProtocol.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

protocol UserRepositoryProtocol {
    var dao: UserDAOProtocol { get }
    var isUserLoggedIn: Bool { get }
    func login()
    func logout()
}
