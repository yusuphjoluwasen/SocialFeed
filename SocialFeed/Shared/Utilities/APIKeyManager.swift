//
//  ApiKeyManager.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import Foundation

final class APIKeyManager: TokenProvider {
    static let shared = APIKeyManager()
    private init() {}

    let key = "league_api_key"

    func saveKey(_ token: String) {
        save(token, for: key)
    }

    func getKey() -> String? {
        load(for: key)
    }

    func save(_ value: String, for key: String) {
        let data = Data(value.utf8)
        let query: CFDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecValueData: data
        ] as CFDictionary

        SecItemDelete(query)
        SecItemAdd(query, nil)
    }

    func load(for key: String) -> String? {
        let query: CFDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ] as CFDictionary

        var result: AnyObject?
        SecItemCopyMatching(query, &result)

        guard let data = result as? Data else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
