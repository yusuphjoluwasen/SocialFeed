//
//  FeedListView.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//
import SwiftUI

struct FeedListView: View {
    let feed: [UserPost]
    let onUserTap: (User) -> Void
    let onPostTap: (UserPost) -> Void

    var body: some View {
        List(feed) { item in
            VStack(alignment: .leading) {
                UserHeaderView(
                    avatar: item.avatar,
                    name: item.username,
                    username: item.username,
                    onTap: {
                        onUserTap(item.user)
                    }
                )

                PostRowView(
                    title: item.title,
                    description: item.description,
                    onTap: {
                        onPostTap(item)
                    }
                )
            }

        }
    }
}

#Preview {
    NavigationStack {
        FeedListView(feed: MockData.feed, onUserTap: { _ in }, onPostTap: { _ in })
    }
}
