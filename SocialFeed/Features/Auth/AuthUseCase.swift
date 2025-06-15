//
//  AuthUsecase.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import Foundation

protocol AuthUseCase {
    func login() async throws
}

final class AuthUseCaseImpl: AuthUseCase {
    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    func login() async throws {
        try await repository.login()
    }
}
