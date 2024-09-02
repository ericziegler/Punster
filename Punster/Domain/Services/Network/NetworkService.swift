//
//  NetworkService.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation
import Alamofire

final class NetworkService: NetworkServiceProtocol {
        
    private(set) var baseURL: String
    // TODO: EZ - Remove
//    var baseURL = "https://v2.jokeapi.dev/joke/Pun/"
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    @discardableResult func request(endpoint: String, parameters: [String: Any]? = nil) async throws -> Data {
        let url = baseURL + endpoint
        // `withCheckedThrowingContinuation` is how we convert async blocks to modern asyn/await syntax.
        // We shouldstrive to use async/await over completion blocks as much as possible.
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(url, method: .get, parameters: parameters).responseData { response in
                switch response.result {
                case .success(let data):
                    continuation.resume(returning: data)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
}
