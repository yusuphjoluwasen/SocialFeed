//
//  PostRowView.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import SwiftUI

struct PostRowView: View {
    let title: String
    let description: String
    let onTap: () -> Void

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)

            Text(description)
                .font(.body)
                .foregroundStyle(.secondary)

            Button(StringConstants.readMore, action: onTap)
                .font(.caption)
                .padding(.top, 4)
        }
    }
}

#Preview {
    PostRowView(title: MockData.userPost.title, description: MockData.userPost.description, onTap: {})
}
