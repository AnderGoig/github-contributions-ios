//
//  ContributionsStorage.swift
//  Contributions
//
//  Created by Ander Goig on 10/8/24.
//

import Foundation

protocol ContributionsStorage: Actor {
    var usernames: [String] { get }
    func setUsernames(_ usernames: [String])
}

// MARK: -

actor DefaultContributionsStorage: ContributionsStorage {
    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }

    var usernames: [String] {
        userDefaults.codable(forKey: "usernames") ?? []
    }

    func setUsernames(_ usernames: [String]) {
        userDefaults.set(value: usernames, forKey: "usernames")
    }
}
