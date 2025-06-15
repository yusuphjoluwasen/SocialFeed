//
//  FeedView.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import SwiftUI

struct FeedView: View {
    @State var presenter: FeedPresenter

    var body: some View {
        Group {
            if presenter.isLoading {
                FeedLoadingView()
            } else if presenter.feed.isEmpty {
                ContentUnavailableView(
                    presenter.errorMessage,
                    systemImage: StringConstants.errorImage
                )
            } else {
                FeedListView(
                    feed: presenter.feed,
                    onUserTap: { user in
                        presenter.showUserProfile(user: user)
                    },
                    onPostTap: { post in
                        presenter.showPostDetail(post: post)
                    }
                )
            }
        }
        .navigationTitle(StringConstants.postsTitle)
        .task {
            await presenter.load()
        }
    }
}

#Preview {
    NavigationStack {
        FeedView(
            presenter: FeedPresenter(useCase: MockFeedUseCase(), router: Router())
        )
    }
}
