//
//  SplashPresenter.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import Observation

@Observable
final class SplashPresenter {
    private let useCase: AuthUseCase
    private let onComplete: () -> Void

    init(useCase: AuthUseCase, onComplete: @escaping () -> Void) {
        self.useCase = useCase
        self.onComplete = onComplete
    }

    func start() {
        Task.detached {
            try? await self.useCase.login()
        }

        Task {
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            onComplete()
        }
    }
}
