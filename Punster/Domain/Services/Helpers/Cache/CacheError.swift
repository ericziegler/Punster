//
//  CacheError.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

enum CacheError: LocalizedError {
    case notFound
    case parsingFailed
    
    var errorDescription: String? {
        switch self {
        case .notFound:
            return "No cached file found."
        case .parsingFailed:
            return "Failed to parse the cached file."
        }
    }
}
