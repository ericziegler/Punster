//
//  CacheService.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

class CacheService: CacheServiceProtocol {
    
    private let userDefaults = UserDefaults()
    
    func loadData(for key: String) -> Data? {
        return userDefaults.data(forKey: key)
    }
    
    func save(data: Data,
              for key: String) {
        userDefaults.set(data, forKey: key)
    }
    
    func removeData(for key: String) {
        userDefaults.removeObject(forKey: key)
    }
    
    func loadString(for key: String) -> String? {
        userDefaults.string(forKey: key)
    }
    
    func save(string: String,
              for key: String) {
        userDefaults.set(string, forKey: key)
    }
}
