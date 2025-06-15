//
//  FeedDetailPresenterTests.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import Testing
@testable import SocialFeed

@Test("FeedDetailPresenter correctly stores the post")
func testFeedDetailPresenterStoresPost() {
    let post = MockData.userPost
    let presenter = FeedDetailPresenter(post: post)

    #expect(presenter.post.id == post.id)
    #expect(presenter.post.title == post.title)
    #expect(presenter.post.description == post.description)
    #expect(presenter.post.user.id == post.user.id)
    #expect(presenter.post.user.name == post.user.name)
    #expect(presenter.post.user.username == post.user.username)
    #expect(presenter.post.user.email == post.user.email)
    #expect(presenter.post.user.avatar == post.user.avatar)
}
