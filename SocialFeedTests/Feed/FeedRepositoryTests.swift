//
//  FeedRepositoryTests.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import Testing
@testable import SocialFeed

@Test("FeedRepository fetches users successfully")
func testFetchUsers() async throws {
    let mockAPI = MockAPIClient()
    let mockTokenProvider = MockTokenProvider()
    mockTokenProvider.save("mock-token", for: "league_api_key")

    let expectedUsers = [MockData.userDTO]
    mockAPI.responses[Endpoint.Path.users] = expectedUsers

    let repo = FeedRepositoryImpl(apiClient: mockAPI, tokenProvider: mockTokenProvider)

    let users = try await repo.fetchUsers()
    #expect(users.first?.id == expectedUsers.first?.id)
    #expect(users.first?.name == expectedUsers.first?.name)
    #expect(users.first?.email == expectedUsers.first?.email)
    #expect(users.first?.username == expectedUsers.first?.username)
    #expect(users.first?.avatar == expectedUsers.first?.avatar)
}

@Test("FeedRepository fetches posts successfully")
func testFetchPosts() async throws {
    let mockAPI = MockAPIClient()
    let mockTokenProvider = MockTokenProvider()
    mockTokenProvider.save("mock-token", for: "league_api_key")

    let expectedPosts = [MockData.postDTO]
    mockAPI.responses[Endpoint.Path.posts] = expectedPosts

    let repo = FeedRepositoryImpl(apiClient: mockAPI, tokenProvider: mockTokenProvider)

    let posts = try await repo.fetchPosts()
    #expect(posts.first?.id == expectedPosts.first?.id)
    #expect(posts.first?.userId == expectedPosts.first?.userId)
    #expect(posts.first?.title == expectedPosts.first?.title)
    #expect(posts.first?.body == expectedPosts.first?.body)
}

@Test("FeedRepository throws decodingFailed when user response is invalid")
func testFetchUsersThrowsDecodingFailed() async throws {
    let mockAPI = MockAPIClient()
    let tokenProvider = MockTokenProvider()
    tokenProvider.save("mock-token", for: "league_api_key")

    // Invalid JSON to simulate decoding error
    mockAPI.responses[Endpoint.Path.users] = "Not valid JSON"

    let repository = FeedRepositoryImpl(apiClient: mockAPI, tokenProvider: tokenProvider)

    do {
        _ = try await repository.fetchUsers()
        #expect(Bool(false), "Expected decodingFailed error")
    } catch {
        #expect(error.localizedDescription == "Failed to decode server response.")
    }
}
