//
//  FeedDetailView.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import SwiftUI

struct FeedDetailView: View {
    let presenter: FeedDetailPresenter

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                UserInfoHeader(post: presenter.post)
                PostContent(post: presenter.post)
            }
            .padding()
        }
        .navigationTitle(StringConstants.post)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        FeedDetailView(presenter: FeedDetailPresenter(post: MockData.userPost))
    }
}
