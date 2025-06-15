//
//  MockApiClient.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import Foundation
@testable import SocialFeed

final class MockAPIClient: APIClient {
    var responses: [String: Any] = [:]

    func get<T: Decodable>(_ type: T.Type, path: String) async throws -> T {
        if let result = responses[path] as? T {
            return result
        } else {
            throw APIError.decodingFailed
        }
    }
}
