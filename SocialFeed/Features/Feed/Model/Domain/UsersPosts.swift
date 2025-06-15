//
//  UserPosts.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//
import Foundation

struct UserPost: Identifiable, Hashable {
    let id: Int
    let user: User
    let title: String
    let description: String
    var avatar: String { user.avatar }
    var username: String { user.username }
}
