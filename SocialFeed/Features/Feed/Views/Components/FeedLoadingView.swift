//
//  FeedLoadingView.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import SwiftUI

struct FeedLoadingView: View {
    var body: some View {
        VStack(spacing: 16) {
            ProgressView()
            Text(StringConstants.loadingFeed)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    FeedLoadingView()
}
