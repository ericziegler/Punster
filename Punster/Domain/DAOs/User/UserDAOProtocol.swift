//
//  UserDAOProtocol.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

protocol UserDAOProtocol {
    var isUserLoggedIn: Bool { get }
    func login()
    func logout()
}
