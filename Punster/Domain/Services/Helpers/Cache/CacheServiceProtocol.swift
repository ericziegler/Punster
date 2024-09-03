//
//  CacheServiceProtocol.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

// !! - The reason we're making everything a protocol is so that nothing at these levels is
//      tightly coupled to anything else. For instance, JokeDAO has a reference to CacheServiceProtocl,
//      which means it can ask for any of the functions listed below. Depending on the configuration, the
//      underlying implementation can be swapped out, but to JokeDAO, it makes no difference.
//
//      The default implementation for CacheServiceProtocol here is CacheService, which just uses UserDefaults
//      since this was the simplest example I could put together. But there's no reason that we couldn't have a
//      MockCacheService that uses an in-memory dictionary instead of UserDefaults. Or maybe we want to use Realm.
//      We can have a RealmCacheService: CacheServiceProtocol. It would implement these functions, and do whatever
//      it needs to under the hood.
protocol CacheServiceProtocol {
    func loadData(for key: String) -> Data?
    func save(data: Data,
              for key: String)
    func removeData(for key: String)
    func loadString(for key: String) -> String?
    func save(string: String,
              for key: String)
    func loadBool(for key: String) -> Bool
    func save(bool: Bool,
              for key: String)
    func loadInt(for key: String) -> Int
    func save(int: Int,
              for key: String)
    func loadDouble(for key: String) -> Double
    func save(double: Double,
              for key: String)
}
