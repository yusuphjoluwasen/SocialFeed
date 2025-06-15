//
//  User.swift
//  SocialFeed
//
//  Created by Guru King on 15/06/2025.
//

import Foundation

struct User: Identifiable, Hashable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let avatar: String
    let phone: String
    let website: String
    let address: String
    let company: String
}
