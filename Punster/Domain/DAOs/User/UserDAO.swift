//
//  UserDAO.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

final class UserDAO: UserDAOProtocol {
    
    private let cacheService: CacheServiceProtocol
    private let isUserLoggedInCacheKey = "com.zigamajig.Punster.isUserLoggedIn"
    
    var isUserLoggedIn: Bool {
        cacheService.loadBool(for: isUserLoggedInCacheKey)
    }
    
    init(cacheService: CacheServiceProtocol) {
        self.cacheService = cacheService
    }
    
    func login() {
        cacheService.save(bool: true, for: isUserLoggedInCacheKey)
    }
    
    func logout() {
        cacheService.removeData(for: isUserLoggedInCacheKey)
    }
}
