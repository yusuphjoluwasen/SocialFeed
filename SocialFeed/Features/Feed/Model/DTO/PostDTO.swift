//
//  Post.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import Foundation

struct PostDTO: Decodable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
