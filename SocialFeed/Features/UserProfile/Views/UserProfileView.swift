//
//  UserProfileView.swift
//  SocialFeed
//
//  Created by Guru King on 15/06/2025.
//
import SwiftUI

struct UserProfileView: View {
    let presenter: UserProfilePresenter

    var body: some View {
        List {
            UserAvatarHeaderView(avatarURL: presenter.user.avatar)
            UserBasicInfoView(user: presenter.user)
            UserAddressView(address: presenter.user.address)
            UserCompanyView(company: presenter.user.company)
        }
        .navigationTitle(StringConstants.profileTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        UserProfileView(presenter: .init(user: MockData.user))
    }
}
