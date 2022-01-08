//
//  ContributionsListViewModel.swift
//  GitHubContributions
//
//  Created by Ander Goig on 07/02/2021.
//

import Foundation

final class ContributionsListViewModel: ObservableObject {

    @Published private(set) var contributions: [ContributionsRowViewModel] = []

    private var usernames: [String] {
        get { UserDefaults.standard.codable(forKey: "usernames") ?? [] }
        set { UserDefaults.standard.set(value: newValue, forKey: "usernames") }
    }

    init() {
        contributions = usernames.map(ContributionsRowViewModel.init)
    }

    func addContributions(from username: String) {
        if !username.trimmingCharacters(in: .whitespaces).isEmpty, !contributions.contains(where: { $0.username.lowercased() == username.lowercased() }) {
            contributions.append(.init(username: username))
            updateStorage()
        }
    }

    func removeContributions(atOffsets offsets: IndexSet) {
        contributions.remove(atOffsets: offsets)
        updateStorage()
    }

    func moveContributions(fromOffsets source: IndexSet, to destination: Int) {
        contributions.move(fromOffsets: source, toOffset: destination)
        updateStorage()
    }

    private func updateStorage() {
        usernames = contributions.map(\.username)
    }

}
