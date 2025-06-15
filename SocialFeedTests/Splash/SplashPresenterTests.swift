//
//  SplashPresenterTests.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//
import Testing
@testable import SocialFeed

@Test("SplashPresenter calls login and onComplete")
func testSplashPresenter() async throws {
    final class MockAuthUseCase: AuthUseCase {
        var loginCalled = false
        func login() async throws {
            loginCalled = true
        }
    }

    var onCompleteCalled = false

    let mockUseCase = MockAuthUseCase()
    let presenter = SplashPresenter(
        useCase: mockUseCase,
        onComplete: {
            onCompleteCalled = true
        }
    )

    presenter.start()

    try? await Task.sleep(nanoseconds: 2_100_000_000)

    #expect(mockUseCase.loginCalled == true)
    #expect(onCompleteCalled == true)
}
