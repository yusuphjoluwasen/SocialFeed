//
//  TokenProvider.swift
//  SocialFeed
//
//  Created by Guru King on 15/06/2025.
//

public protocol TokenProvider {
    func save(_ value: String, for key: String)
    func load(for key: String) -> String?
}

final class MockTokenProvider: TokenProvider {
    private var storage: [String: String] = [:]

    func save(_ value: String, for key: String) {
        storage[key] = value
    }

    func load(for key: String) -> String? {
        storage[key]
    }
}
