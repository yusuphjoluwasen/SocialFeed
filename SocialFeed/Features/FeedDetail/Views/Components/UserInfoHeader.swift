//
//  UserInfoHeader.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import SwiftUI

struct UserInfoHeader: View {
    let post: UserPost

    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: URL(string: post.avatar)) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 48, height: 48)
            .clipShape(Circle())

            VStack(alignment: .leading) {
                Text(post.username)
                    .font(.headline)
                Text("@\(post.username)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview { UserInfoHeader(post: MockData.userPost) }
