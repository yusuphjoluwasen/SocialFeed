//
//  FeedRepository.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

protocol FeedRepository {
    func fetchUsers() async throws -> [UserDTO]
    func fetchPosts() async throws -> [PostDTO]
}

final class FeedRepositoryImpl: FeedRepository {
    private let apiClient: APIClient
    private let tokenProvider: TokenProvider

    init(apiClient: APIClient, tokenProvider: TokenProvider = APIKeyManager.shared) {
        self.apiClient = apiClient
        self.tokenProvider = tokenProvider
    }

    func fetchUsers() async throws -> [UserDTO] {
        guard let token = tokenProvider.load(for: APIKeyManager.shared.key), !token.isEmpty else {
            throw APIError.invalidToken
        }

        return try await apiClient.get([UserDTO].self, path: Endpoint.Path.users)
    }

    func fetchPosts() async throws -> [PostDTO] {
        guard let token = tokenProvider.load(for: APIKeyManager.shared.key), !token.isEmpty else {
            throw APIError.invalidToken
        }

        return try await apiClient.get([PostDTO].self, path: Endpoint.Path.posts)
    }
}
