//
//  UserAddressView.swift
//  SocialFeed
//
//  Created by Guru King on 15/06/2025.
//

import SwiftUI

struct UserAddressView: View {
    let address: String

    var body: some View {
        Section(StringConstants.userAddress) {
            Text(address)
        }
    }
}

#Preview { UserAddressView(address: MockData.user.address) }
