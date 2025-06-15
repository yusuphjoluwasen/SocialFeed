//
//  UserProfilePresenterTests.swift
//  SocialFeed
//
//  Created by Guru King on 15/06/2025.
//

import Testing
@testable import SocialFeed

@Test("UserProfilePresenter correctly stores the user")
func testUserProfilePresenterStoresUser() {
    let user = MockData.user
    let presenter = UserProfilePresenter(user: user)

    #expect(presenter.user.id == user.id)
    #expect(presenter.user.name == user.name)
    #expect(presenter.user.username == user.username)
    #expect(presenter.user.email == user.email)
    #expect(presenter.user.avatar == user.avatar)
    #expect(presenter.user.phone == user.phone)
    #expect(presenter.user.website == user.website)
    #expect(presenter.user.address == user.address)
    #expect(presenter.user.company == user.company)
}
