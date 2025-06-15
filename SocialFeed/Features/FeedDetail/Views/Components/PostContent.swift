//
//  PostContent.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//
import SwiftUI

struct PostContent: View {
    let post: UserPost

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(post.title)
                .font(.title2.bold())

            Text(post.description)
                .font(.body)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview { PostContent(post: MockData.userPost) }
