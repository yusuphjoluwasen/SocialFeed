//
//  AppRoute.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import SwiftUI

enum AppRoute: Hashable {
    case postDetail(UserPost)
    case userProfile(User)
}

@Observable
final class Router {
    var navPath = NavigationPath()

    func go(to destination: AppRoute) {
        navPath.append(destination)
    }
}
