//
//  EndPoint.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import Foundation

enum Endpoint {
    static let baseURL = "https://engineering.league.dev/challenge/api"

    enum Path {
        static let users = "/users"
        static let posts = "/posts"
        static let login = "/login"
    }
}
