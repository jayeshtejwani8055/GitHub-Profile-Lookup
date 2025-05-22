//
//  GitHubUser.swift
//  GitHub Profile Lookup
//
//  Created by Jayesh Tejwani on 22/05/25.
//

import Foundation

struct GitHubUser: Decodable {
    let name: String?
    let avatarURL: URL
    let publicRepos: Int

    enum CodingKeys: String, CodingKey {
        case name
        case avatarURL = "avatar_url"
        case publicRepos = "public_repos"
    }
}
