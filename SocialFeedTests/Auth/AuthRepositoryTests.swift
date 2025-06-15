//
//  AuthRepositoryTests.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import Testing
@testable import SocialFeed

@Test("AuthRepository saves token after login")
func testAuthLoginSavesToken() async throws {
    let mockAPI = MockAPIClient()
    let mockTokenProvider = MockTokenProvider()
    let expectedToken = "mock-api-key"

    mockAPI.responses[Endpoint.Path.login] = AuthResponse(apiKey: expectedToken)

    let repo = AuthRepositoryImpl(apiClient: mockAPI, tokenProvider: mockTokenProvider)

    try await repo.login()

    let savedToken = mockTokenProvider.load(for: "league_api_key")
    #expect(savedToken == expectedToken)
}

@Test("AuthRepository throws decodingFailed when response is invalid")
func testAuthLoginThrowsDecodingFailed() async throws {
    let mockAPI = MockAPIClient()
    let mockTokenProvider = MockTokenProvider()

    mockAPI.responses[Endpoint.Path.login] = "Invalid Data"

    let repo = AuthRepositoryImpl(apiClient: mockAPI, tokenProvider: mockTokenProvider)

    do {
        try await repo.login()
        #expect(Bool(false), "Expected decodingFailed error")
    } catch {
        #expect(error.localizedDescription == "Failed to decode server response.")
    }
}
