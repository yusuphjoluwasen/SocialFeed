//
//  UserProfileDI.swift
//  SocialFeed
//
//  Created by Guru King on 15/06/2025.
//

import SwiftUI

enum UserProfileDI {
    static func makeView(user: User) -> some View {
        let presenter = UserProfilePresenter(user: user)
        return UserProfileView(presenter: presenter)
    }
}
