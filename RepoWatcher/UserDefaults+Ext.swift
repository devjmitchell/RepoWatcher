//
//  UserDefaults+Ext.swift
//  RepoWatcher
//
//  Created by Jason Mitchell on 4/4/24.
//

import Foundation

extension UserDefaults {
    static var shared: UserDefaults {
        UserDefaults(suiteName: "group.com.semperphoenix.RepoWatcher")!
    }
    
    static let repoKey = "repos"
}

enum UserDefaultsError: Error {
    case retrieval
}
