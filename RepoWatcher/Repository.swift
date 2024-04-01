//
//  Repository.swift
//  RepoWatcher
//
//  Created by Jason Mitchell on 4/1/24.
//

import Foundation

struct Repository: Decodable {
    let name: String
    let owner: Owner
    let hasIssues: Bool
    let forks: Int
    let watchers: Int
    let openIssues: Int
    let pushedAt: String
    
    static let placeholder = Repository(name: "Your Repo",
                                        owner: Owner(avatarUrl: ""),
                                        hasIssues: true,
                                        forks: 65,
                                        watchers: 123,
                                        openIssues: 55,
                                        pushedAt: "2024-04-01T16:04:20Z")
}

struct Owner: Decodable {
    let avatarUrl: String
}
