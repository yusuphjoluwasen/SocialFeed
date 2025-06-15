//
//  MockData.swift
//  SocialFeed
//
//  Created by Guru King on 15/06/2025.
//

import Foundation

enum MockData {
    static let user = User(
        id: 1,
        name: "Clementine Bauch",
        username: "Samantha",
        email: "Nathan@yesenia.net",
        avatar: "https://i.pravatar.cc/150?u=Nathan@yesenia.net",
        phone: "1-463-123-4447",
        website: "ramiro.info",
        address: "Douglas Extension, McKenziehaven",
        company: "Romaguera-Jacobson"
    )

    static let userDTO = UserDTO(
        id: 1,
        avatar: "https://i.pravatar.cc/150?u=Nathan@yesenia.net", name: "Clementine Bauch",
        username: "Samantha",
        email: "Nathan@yesenia.net",
        phone: "1-463-123-4447",
        website: "ramiro.info",
        address: UserDTO.Address(
            street: "Douglas Extension",
            suite: "Suite 847",
            city: "McKenziehaven",
            zipcode: "59590-4157"
        ),
        company: UserDTO.Company(
            name: "Romaguera-Jacobson",
            catchPhrase: "Face to face bifurcated interface"
        )
    )

    static let postDTO = PostDTO(
        id: 101,
        userId: 1,
        title: "Post Title",
        body: "This is a sample post body."
    )

    static let userPost = UserPost(
        id: 101,
        user: user,
        title: "Post Title",
        description: "This is a sample post body."
    )

    static let feed: [UserPost] = [userPost, userPost]
}
