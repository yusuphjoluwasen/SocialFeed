//
//  ApiErrorTests.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//
import Testing
import Foundation
@testable import SocialFeed

@Test("APIError returns correct localized descriptions", arguments: [
    (APIError.invalidURL, "The URL is invalid."),
    (APIError.decodingFailed, "Failed to decode server response."),
    (APIError.unknown(NSError(domain: "Test", code: -1,
     userInfo: [NSLocalizedDescriptionKey: "Something went wrong."])), "Something went wrong.")
])
func testAPIErrorDescriptions(error: APIError, expectedDescription: String) {
    #expect(error.localizedDescription == expectedDescription)
}

@Test("APIError.requestFailed includes status code")
func testRequestFailedMessage() {
    let error = APIError.requestFailed(500)
    let message = error.localizedDescription

    #expect(message == "Request failed with status code 500.")
}
