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
                                        avatarData: Data())
    
    static let repoTwo = Repository(name: "Repository 2",
                                        owner: Owner(avatarUrl: ""),
                                        hasIssues: false,
                                        forks: 134,
                                        watchers: 976,
                                        openIssues: 122,
                                        pushedAt: "2024-01-10T16:04:20Z",
                                        avatarData: Data())
    
    
}
