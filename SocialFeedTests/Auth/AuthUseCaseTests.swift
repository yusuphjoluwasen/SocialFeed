//
//  AuthUseCaseTests.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//
import Testing
@testable import SocialFeed
import Foundation

@Test("AuthUseCase calls repository login successfully")
func testAuthUseCaseSuccess() async throws {

    let mockRepo = MockAuthRepository()
    let useCase = AuthUseCaseImpl(repository: mockRepo)

    try await useCase.login()

    #expect(mockRepo.loginCalled)
}

@Test("AuthUseCase propagates error from repository")
func testAuthUseCaseErrorPropagation() async throws {
    struct DummyError: Error, LocalizedError {
        var errorDescription: String? { "Mock error" }
    }

    final class MockFailingAuthRepository: AuthRepository {
        func login() async throws {
            throw DummyError()
        }
    }

    let useCase = AuthUseCaseImpl(repository: MockFailingAuthRepository())

    do {
        try await useCase.login()
        #expect(Bool(false), "Expected an error to be thrown")
    } catch {
        #expect(error.localizedDescription == "Mock error")
    }
}
