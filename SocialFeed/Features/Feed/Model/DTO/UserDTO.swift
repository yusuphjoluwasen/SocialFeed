//
//  User.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import Foundation

struct UserDTO: Decodable, Identifiable {
    let id: Int
    let avatar: String
    let name: String
    let username: String
    let email: String
    let phone: String
    let website: String

    let address: Address?
    let company: Company?

    struct Address: Decodable {
        let street: String
        let suite: String
        let city: String
        let zipcode: String
    }

    struct Company: Decodable {
        let name: String
        let catchPhrase: String
    }
}

extension UserDTO {
    func toDomain() -> User {
        return User(
            id: self.id,
            name: self.name,
            username: self.username,
            email: self.email,
            avatar: self.avatar,
            phone: self.phone,
            website: self.website,
            address: [self.address?.street, self.address?.city]
                .compactMap { $0 }
                .joined(separator: ", "),
            company: self.company?.name ?? ""
        )
    }
}
