//
//  FeedDIContainer.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import SwiftUI

enum FeedDI {
    static func makeView(router: Router) -> some View {
        let client = APIClientImpl()
        let repository = FeedRepositoryImpl(apiClient: client)
        let useCase = FeedUseCaseImpl(repository: repository)
        let presenter = FeedPresenter(useCase: useCase, router: router)
        return FeedView(presenter: presenter)
    }
}
