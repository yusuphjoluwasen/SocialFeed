//
//  FeedUseCaseTests.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//
import Foundation
import Testing
@testable import SocialFeed

@Test("FeedUseCase returns combined UserPost list")
func testFeedUseCaseSuccess() async throws {
    let mock = MockFeedRepository()
    mock.mode = .success

    let useCase = FeedUseCaseImpl(repository: mock)
    let result = try await useCase.execute()

    #expect(result.count == 1)
    #expect(result.first?.title == "Title")
    #expect(result.first?.username == "user1")
    #expect(result.first?.description == "Body")
}

@Test("FeedUseCase propagates error from fetchUsers")
func testFeedUseCaseUserFetchFails() async throws {
    let mock = MockFeedRepository()
    mock.mode = .failUsers

    let useCase = FeedUseCaseImpl(repository: mock)

    do {
        _ = try await useCase.execute()
        #expect(Bool(false), "Expected fetchUsers to throw")
    } catch {
        #expect(error.localizedDescription == "User fetch failed")
    }
}

@Test("FeedUseCase propagates error from fetchPosts")
func testFeedUseCasePostFetchFails() async throws {
    let mock = MockFeedRepository()
    mock.mode = .failPosts

    let useCase = FeedUseCaseImpl(repository: mock)

    do {
        _ = try await useCase.execute()
        #expect(Bool(false), "Expected fetchPosts to throw")
    } catch {
        #expect(error.localizedDescription == "Post fetch failed")
    }
}
