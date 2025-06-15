//
//  APIClient.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import Foundation

protocol APIClient {
    func get<T: Decodable>(_ type: T.Type, path: String) async throws -> T
}

final class APIClientImpl: APIClient {
    private let session: URLSession
    private let requestBuilder: RequestBuilder
    
    init(session: URLSession = .shared, tokenProvider: TokenProvider = APIKeyManager.shared) {
        self.session = session
        self.requestBuilder = RequestBuilder(tokenProvider: tokenProvider)
    }
    
    func get<T: Decodable>(_ type: T.Type, path: String) async throws -> T {
        let request = try requestBuilder.buildGETRequest(path: path)
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.requestFailed(-1)
        }
        
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw APIError.requestFailed(httpResponse.statusCode)
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
        } catch {
            throw APIError.decodingFailed
        }
    }
}
