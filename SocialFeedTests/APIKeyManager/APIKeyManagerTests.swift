//
//  ApiKeyManagerTests.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import Testing
@testable import SocialFeed

@Test("MockKeyValueStore stores and loads key", arguments: [
    ("test_key_1", "abc123"),
    ("test_key_2", "xyz789"),
    ("empty_value", "")
])

func testMockKeyValueStore(key: String, value: String) {
    let store = MockTokenProvider()
    store.save(value, for: key)

    let result = store.load(for: key)
    #expect(result == value)
}
