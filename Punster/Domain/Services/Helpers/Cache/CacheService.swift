//
//  CacheService.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

final class CacheService: CacheServiceProtocol {
    
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
    
    func loadBool(for key: String) -> Bool {
        userDefaults.bool(forKey: key)
    }
    
    func save(bool: Bool,
              for key: String) {
        userDefaults.set(bool, forKey: key)
    }
    
    func loadInt(for key: String) -> Int {
        userDefaults.integer(forKey: key)
    }
    
    func save(int: Int,
              for key: String) {
        userDefaults.set(int, forKey: key)
    }
    
    func loadDouble(for key: String) -> Double {
        userDefaults.double(forKey: key)
    }
    
    func save(double: Double,
              for key: String) {
        userDefaults.set(double, forKey: key)
    }
}
