//
//  MainAppView.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import SwiftUI

enum AppState {
    case splash
    case feed
}

struct MainAppView: View {
    @State private var appState: AppState = .splash
    @State private var router = Router()

    var body: some View {
        NavigationStack(path: $router.navPath) {
            currentRoot
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .postDetail(let post):
                        FeedDetailDI.makeView(post: post)
                    case .userProfile(let user):
                        UserProfileDI.makeView(user: user)
                    }
                }
        }
        .environment(router)
    }

    @ViewBuilder
    private var currentRoot: some View {
        switch appState {
        case .splash:
            SplashDI.makeView(onComplete: {
                withAnimation {
                    appState = .feed
                }
            })
        case .feed:
            FeedDI.makeView(router: router)
        }
    }
}

#Preview {
    MainAppView()
}
