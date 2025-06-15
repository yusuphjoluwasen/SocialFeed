//
//  UserHeaderView.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import SwiftUI

struct UserHeaderView: View {
    let avatar: String
    let name: String
    let username: String
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 12) {
                AsyncImage(url: URL(string: avatar)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 40, height: 40)
                .clipShape(Circle())

                VStack(alignment: .leading, spacing: 2) {
                    Text(name).bold()
                    Text("@\(username)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    UserHeaderView(avatar: MockData.user.avatar, name: MockData.user.name, username: MockData.user.username, onTap: {})
}
