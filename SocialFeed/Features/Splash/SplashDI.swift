//
//  SplashDI.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import SwiftUI

enum SplashDI {
    static func makeView(onComplete: @escaping () -> Void) -> some View {
        let apiClient = APIClientImpl()
        let repository = AuthRepositoryImpl(apiClient: apiClient)
        let useCase = AuthUseCaseImpl(repository: repository)
        let presenter = SplashPresenter(useCase: useCase, onComplete: onComplete)
        return SplashView(presenter: presenter)
    }
}
