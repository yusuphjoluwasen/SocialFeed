//
//  APIClientTests.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//
import Foundation
import Testing
@testable import SocialFeed

final class APIClientTests {

    var client: APIClientImpl?
    init() async throws {
        let tokenProvider = MockTokenProvider()

         client = APIClientImpl(
            session: .mocked,
            tokenProvider: tokenProvider
        )
      }

    @Test("APIClient fetches and decodes JSON successfully")
    func testSuccessfulGETRequest() async throws {

        let expected = DummyData(message: "Hello!")
        let mockData = try JSONEncoder().encode(expected)

        MockURLProtocol.stubData = mockData
        MockURLProtocol.statusCode = 200

        let result = try await client?.get(DummyData.self, path: "/mock")
        #expect(result?.message == "Hello!")
    }

    @Test("APIClient throws .requestFailed when status code is 401")
    func testRequestFailed() async throws {

        MockURLProtocol.statusCode = 401
        MockURLProtocol.stubData = Data()

        do {
            _ = try await client?.get(DummyData.self, path: "/mock")
        } catch let error {
            #expect(error.localizedDescription == "Request failed with status code 401.")
        }
    }

    @Test("APIClient throws .decodingFailed on invalid JSON")
    func testDecodingFailed() async throws {

        MockURLProtocol.statusCode = 200
        MockURLProtocol.stubData = Data("not-json".utf8)

        do {
            _ = try await client?.get(DummyData.self, path: "/mock")
        } catch let error as APIError {
            #expect(error.localizedDescription == "Failed to decode server response.")
        }
    }

    deinit{
        MockURLProtocol.reset()
    }
}
