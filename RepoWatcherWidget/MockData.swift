//
//  MockData.swift
//  RepoWatcher
//
//  Created by Jason Mitchell on 4/2/24.
//

import Foundation

struct MockData {
    static let repoOne = Repository(name: "Repository 1",
                                    owner: Owner(avatarUrl: ""),
                                    hasIssues: true,
                                    forks: 65,
                                    watchers: 123,
                                    openIssues: 55,
                                    pushedAt: "2024-03-15T16:04:20Z",
                                    avatarData: Data(),
                                    contributors: [Contributor(login: "Jason Mitchell", avatarUrl: "", contributions: 42, avatarData: Data()),
                                                   Contributor(login: "Sean Allen", avatarUrl: "", contributions: 23, avatarData: Data()),
                                                   Contributor(login: "Paul Hudson", avatarUrl: "", contributions: 30, avatarData: Data()),
                                                   Contributor(login: "John Sundell", avatarUrl: "", contributions: 6, avatarData: Data())])
    
    static let repoOneV2 = Repository(name: "Repository 1",
                                      owner: Owner(avatarUrl: ""),
                                      hasIssues: true,
                                      forks: 112,
                                      watchers: 327,
                                      openIssues: 100,
                                      pushedAt: "2024-03-29T16:04:20Z",
                                      avatarData: Data(),
                                      contributors: [Contributor(login: "Jason Mitchell", avatarUrl: "", contributions: 149, avatarData: Data()),
                                                     Contributor(login: "Sean Allen", avatarUrl: "", contributions: 50, avatarData: Data()),
                                                     Contributor(login: "Paul Hudson", avatarUrl: "", contributions: 39, avatarData: Data()),
                                                     Contributor(login: "John Sundell", avatarUrl: "", contributions: 16, avatarData: Data())])
    
    static let repoTwo = Repository(name: "Repository 2",
                                    owner: Owner(avatarUrl: ""),
                                    hasIssues: false,
                                    forks: 134,
                                    watchers: 976,
                                    openIssues: 122,
                                    pushedAt: "2024-01-10T16:04:20Z",
                                    avatarData: Data())
    
    
}
