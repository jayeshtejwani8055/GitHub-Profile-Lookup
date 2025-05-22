//
//  GitHubAPIService.swift
//  GitHub Profile Lookup
//
//  Created by Jayesh Tejwani on 22/05/25.
//

import Foundation

protocol GitHubAPIServiceProtocol {
    func fetchUser(for username: String) async throws -> GitHubUser
}

enum GitHubAPIError: Error, LocalizedError {
    case invalidURL
    case userNotFound
    case decodingError
    case rateLimit
    case unknown

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "The username provided is not valid."
        case .userNotFound: return "GitHub user not found."
        case .decodingError: return "Failed to decode user profile."
        case .rateLimit: return "API rate limit exceeded"
        case .unknown: return "An unknown error occurred."
        }
    }
}

final class GitHubAPIService: GitHubAPIServiceProtocol {

    func fetchUser(for username: String) async throws -> GitHubUser {
        guard let url = URL(string: "https://api.github.com/users/\(username)") else {
            throw GitHubAPIError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw GitHubAPIError.unknown
        }

        switch httpResponse.statusCode {
        case 200:
            do {
                return try JSONDecoder().decode(GitHubUser.self, from: data)
            } catch {
                throw GitHubAPIError.decodingError
            }

        case 403:
            throw GitHubAPIError.rateLimit
        case 404:
            throw GitHubAPIError.userNotFound

        default:
            throw GitHubAPIError.unknown
        }
    }
}
