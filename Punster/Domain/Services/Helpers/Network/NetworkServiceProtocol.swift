//
//  NetworkServiceProtocol.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

protocol NetworkServiceProtocol {
    var baseURL: String { get }
    @discardableResult func request(endpoint: String,
                                    parameters: [String : Any]?) async throws -> Data
}
