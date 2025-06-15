//
//  AuthRepository.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import Foundation

protocol AuthRepository {
    func login() async throws
}

final class AuthRepositoryImpl: AuthRepository {
    private let apiClient: APIClient
    private let tokenProvider: TokenProvider

    init(apiClient: APIClient, tokenProvider: TokenProvider = APIKeyManager.shared) {
        self.apiClient = apiClient
        self.tokenProvider = tokenProvider
    }

    func login() async throws {
        let response = try await apiClient.get(AuthResponse.self, path: Endpoint.Path.login)
        tokenProvider.save(response.apiKey, for: APIKeyManager.shared.key)
    }
}
