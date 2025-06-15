//
//  UserBasicInfoView.swift
//  SocialFeed
//
//  Created by Guru King on 15/06/2025.
//

import SwiftUI

struct UserBasicInfoView: View {
    let user: User

    var body: some View {
        Section(StringConstants.userInfo) {
            LabeledContent(StringConstants.name, value: user.name)
            LabeledContent(StringConstants.username, value: user.username)
            LabeledContent(StringConstants.email, value: user.email)
            LabeledContent(StringConstants.phone, value: user.phone)
            LabeledContent(StringConstants.website, value: user.website)
        }
    }
}

#Preview { UserBasicInfoView(user: MockData.user) }
