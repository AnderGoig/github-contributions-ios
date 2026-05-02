//
//  ContributionsApp.swift
//  Contributions
//
//  Created by Ander Goig on 14/10/2020.
//

import InterfaceKit
import SwiftUI

@main
struct ContributionsApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    ContributionsList(viewModel: .init(storage: DefaultContributionsStorage()))
                }
                .tabItem {
                    Image(systemName: "square.grid.3x3.fill")
                    Text("app-title")
                }

                NavigationView {
                    SettingsView(viewModel: .init())
                }
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("settings-title")
                }
            }
        }
    }
}

// MARK: -

extension ContributionsApp {
    /// App's current version.
    static var version: String? {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }

    /// App's current build number.
    static var build: String? {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    }

    /// App's current version and build number.
    static var fullVersion: String? {
        guard let version = version else { return nil }
        guard let build = build else { return version }
        return "\(version) (\(build))"
    }
}
