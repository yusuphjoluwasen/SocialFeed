//
//  UserCompanyView.swift
//  SocialFeed
//
//  Created by Guru King on 15/06/2025.
//

import SwiftUI

struct UserCompanyView: View {
    let company: String

    var body: some View {
        Section(StringConstants.userCompany) {
            Text(company)
        }
    }
}

#Preview { UserCompanyView(company: MockData.user.company) }
