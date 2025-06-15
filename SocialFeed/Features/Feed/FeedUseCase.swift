//
//  FetchUserPostUseCase.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

protocol FeedUseCase {
    func execute() async throws -> [UserPost]
}

final class FeedUseCaseImpl: FeedUseCase {
    private let repository: FeedRepository

    init(repository: FeedRepository) {
        self.repository = repository
    }

    func execute() async throws -> [UserPost] {
        async let usersDTO = repository.fetchUsers()
        async let postsDTO = repository.fetchPosts()

        let (userList, postList) = try await (usersDTO, postsDTO)

        return combine(users: userList, posts: postList)
    }

    private func combine(users: [UserDTO], posts: [PostDTO]) -> [UserPost] {
        let userMap = Dictionary(uniqueKeysWithValues: users.map { ($0.id, $0.toDomain()) })

        return posts.compactMap { post in
            guard let user = userMap[post.userId] else { return nil }

            return UserPost(
                id: post.id,
                user: user,
                title: post.title,
                description: post.body
            )
        }
    }
}
