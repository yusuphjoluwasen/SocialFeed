//
//  MockAuthRepository.swift
//  SocialFeed
//
//  Created by Guru King on 15/06/2025.
//

final class MockAuthRepository: AuthRepository {
    var loginCalled = false

    func login() async throws {
        loginCalled = true
    }
}
