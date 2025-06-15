//
//  FeedDetailDI.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import SwiftUI

enum FeedDetailDI {
    static func makeView(post: UserPost) -> some View {
        let presenter = FeedDetailPresenter(post: post)
        return FeedDetailView(presenter: presenter)
    }
}
