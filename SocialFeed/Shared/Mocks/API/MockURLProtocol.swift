//
//  MockURLProtocol.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//
import Foundation

final class MockURLProtocol: URLProtocol {
    static var stubData: Data?
    static var statusCode: Int = 200
    static var responseHeaders: [String: String]?
    static var simulateNonHTTP = false

    // Reset for clean test state
    static func reset() {
        stubData = nil
        statusCode = 200
        responseHeaders = nil
        simulateNonHTTP = false
    }

    override static func canInit(with request: URLRequest) -> Bool { true }

    override static func canonicalRequest(for request: URLRequest) -> URLRequest { request }

    override func startLoading() {
        let url = request.url!

        let response: URLResponse = Self.simulateNonHTTP
            ? URLResponse(url: url, mimeType: nil, expectedContentLength: 0, textEncodingName: nil)
            : HTTPURLResponse(url: url,
                              statusCode: Self.statusCode,
                              httpVersion: "HTTP/1.1",
                              headerFields: Self.responseHeaders)!

        client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)

        if let data = Self.stubData {
            client?.urlProtocol(self, didLoad: data)
        }

        client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {}
}

extension URLSession {
    static var mocked: URLSession {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        return URLSession(configuration: config)
    }
}

struct DummyData: Codable, Equatable {
    let message: String
}
