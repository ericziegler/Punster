//
//  CacheServiceProtocol.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

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
