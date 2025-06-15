//
//  FeedPresenterTests.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//
import Foundation
import Testing
@testable import SocialFeed

@Test("FeedPresenter loads and sets feed on success")
func testLoadFeedSuccess() async throws {
    final class MockFeedUseCase: FeedUseCase {
        func execute() async throws -> [UserPost] {
            [UserPost(id: 1, user: User(id: 1, name: "User Name", username: "user", email: "user@example.com",
            avatar: "avatar", phone: "1234567890", website: "example.com",
            address: "123 Main St, City", company: "Company Inc"), title: "Title", description: "desc")]
        }
    }

    let useCase = MockFeedUseCase()
    let router = Router()
    let presenter = FeedPresenter(useCase: useCase, router: router)

    await presenter.load()

    #expect(presenter.isLoading == false)
    #expect(presenter.errorMessage.isEmpty)
    #expect(presenter.feed.count == 1)
    #expect(presenter.feed.first?.title == "Title")
    #expect(presenter.feed.first?.description == "desc")

    let user = presenter.feed.first?.user
    #expect(user?.id == 1)
    #expect(user?.name == "User Name")
    #expect(user?.username == "user")
    #expect(user?.email == "user@example.com")
    #expect(user?.avatar == "avatar")
    #expect(user?.phone == "1234567890")
    #expect(user?.website == "example.com")
    #expect(user?.address == "123 Main St, City")
    #expect(user?.company == "Company Inc")
}

@Test("FeedPresenter sets error message on failure")
func testLoadFeedFailure() async throws {
    struct FakeError: LocalizedError {
        var errorDescription: String? { "Something went wrong" }
    }

    final class FailingFeedUseCase: FeedUseCase {
        func execute() async throws -> [UserPost] {
            throw FakeError()
        }
    }

    let presenter = FeedPresenter(useCase: FailingFeedUseCase(), router: Router())

    await presenter.load()

    #expect(presenter.feed.isEmpty)
    #expect(presenter.errorMessage == "Something went wrong")
    #expect(presenter.isLoading == false)
}
