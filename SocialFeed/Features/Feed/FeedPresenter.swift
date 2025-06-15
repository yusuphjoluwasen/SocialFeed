//
//  FeedPresenter.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//
import Observation

@Observable
final class FeedPresenter {
    private let useCase: FeedUseCase
    private let router: Router

    var feed: [UserPost] = []
    var isLoading: Bool = false
    var errorMessage: String = ""

    init(useCase: FeedUseCase, router: Router) {
        self.useCase = useCase
        self.router = router
    }

    func load() async {
        isLoading = true
        errorMessage = ""
        defer { isLoading = false }

        do {
            feed = try await useCase.execute()
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func showPostDetail(post: UserPost) {
        router.go(to: .postDetail(post))
    }

    func showUserProfile(user: User) {
        router.go(to: .userProfile(user))
    }
}
