//
//  APIError.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case requestFailed(Int)
    case decodingFailed
    case unknown(Error)
    case invalidToken

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "The URL is invalid."
        case .requestFailed(let code): return "Request failed with status code \(code)."
        case .decodingFailed: return "Failed to decode server response."
        case .invalidToken: return "Session expired. Please restart the app"
        case .unknown(let error): return error.localizedDescription
        }
    }
}
