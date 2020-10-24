//
//  GitHubContributionsApp.swift
//  GitHubContributions
//
//  Created by Ander Goig on 14/10/2020.
//

import SwiftUI

@main
struct GitHubContributionsApp: App {

    var body: some Scene {
        WindowGroup {
            SettingsView(viewModel: .init())
        }
    }

}

// MARK: -

extension GitHubContributionsApp {

    /// App's current version.
    static var version: String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }

    /// App's current build number.
    static var build: String? {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    }

    /// App's current version and build number.
    static var fullVersion: String? {
        guard let version = version else { return nil }
        guard let build = build else { return version }
        return "\(version) (\(build))"
    }

}
