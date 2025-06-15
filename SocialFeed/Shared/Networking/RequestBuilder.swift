//
//  RequestBuilder.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//
import Foundation

struct RequestBuilder {
    let tokenProvider: TokenProvider

    init(tokenProvider: TokenProvider = APIKeyManager.shared) {
        self.tokenProvider = tokenProvider
    }

    func buildGETRequest(path: String) throws -> URLRequest {
        guard let url = URL(string: Endpoint.baseURL + path) else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        if let token = tokenProvider.load(for: "league_api_key") {
            request.setValue(token, forHTTPHeaderField: "x-access-token")
        }

        return request
    }
}
