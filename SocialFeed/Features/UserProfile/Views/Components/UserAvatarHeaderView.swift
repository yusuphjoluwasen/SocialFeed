//
//  UserAvatarHeaderView.swift
//  SocialFeed
//
//  Created by Guru King on 15/06/2025.
//

import SwiftUI

struct UserAvatarHeaderView: View {
    let avatarURL: String

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: avatarURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray
            }
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .shadow(radius: 4)
            .padding(.vertical)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview { UserAvatarHeaderView(avatarURL: MockData.user.avatar) }
