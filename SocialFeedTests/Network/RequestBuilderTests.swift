//
//  RequestBuilderTests.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import Testing
import Foundation
@testable import SocialFeed

@Test("RequestBuilder builds valid GET request")
func testBuildGETRequest() throws {
    let mock = MockTokenProvider()
    let builder = RequestBuilder(tokenProvider: mock)
    let request = try builder.buildGETRequest(path: "/users")

    #expect(request.url?.absoluteString == "https://engineering.league.dev/challenge/api/users")
    #expect(request.httpMethod == "GET")
}

@Test("RequestBuilder adds token from TokenProvider")
func testTokenHeaderInjection() throws {
    let mock = MockTokenProvider()
    mock.save("xyz_token", for: "league_api_key")

    let builder = RequestBuilder(tokenProvider: mock)
    let request = try builder.buildGETRequest(path: "/posts")

    let token = request.value(forHTTPHeaderField: "x-access-token")
    #expect(token == "xyz_token")
    #expect(request.url?.absoluteString == "https://engineering.league.dev/challenge/api/posts")
}
