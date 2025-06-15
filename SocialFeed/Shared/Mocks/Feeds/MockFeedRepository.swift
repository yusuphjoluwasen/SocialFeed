//
//  MockFeedRepository.swift
//  SocialFeed
//
//  Created by Guru King on 15/06/2025.
//
import Foundation

final class MockFeedRepository: FeedRepository {
    enum Mode {
        case success
        case failUsers
        case failPosts
    }

    var mode: Mode = .success

    struct FailUsersError: Error, LocalizedError {
        var errorDescription: String? { "User fetch failed" }
    }

    struct FailPostsError: Error, LocalizedError {
        var errorDescription: String? { "Post fetch failed" }
    }

    func fetchUsers() async throws -> [UserDTO] {
        switch mode {
        case .failUsers:
            throw FailUsersError()
        default:
            return [UserDTO(id: 1, avatar: "https://i.pravatar.cc/150?u=user1", name: "User One", username: "user1",
            email: "user1@example.com", phone: "123-456-7890", website: "userone.dev",
            address: UserDTO.Address(street: "123 Main St", suite: "Apt 4B", city: "Metropolis", zipcode: "12345"),
            company: UserDTO.Company(name: "Example Corp", catchPhrase: "Innovate the future")
            )]
        }
    }

    func fetchPosts() async throws -> [PostDTO] {
        switch mode {
        case .failPosts:
            throw FailPostsError()
        default:
            return [PostDTO(id: 10, userId: 1, title: "Title", body: "Body")]
        }
    }
}
