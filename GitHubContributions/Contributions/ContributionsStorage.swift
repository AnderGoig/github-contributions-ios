//
//  ContributionsStorage.swift
//  GitHubContributions
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
    var usernames: [String] {
        UserDefaults.standard.codable(forKey: "usernames") ?? []
    }

    func setUsernames(_ usernames: [String]) {
        UserDefaults.standard.set(value: usernames, forKey: "usernames")
    }
}
