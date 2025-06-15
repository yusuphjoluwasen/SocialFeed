//
//  MockuseCase.swift
//  SocialFeed
//
//  Created by Guru King on 15/06/2025.
//

final class MockFeedUseCase: FeedUseCase {
    func execute() async throws -> [UserPost] {
        return MockData.feed
    }
}
