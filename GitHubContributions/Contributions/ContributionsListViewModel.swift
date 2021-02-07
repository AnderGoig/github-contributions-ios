//
//  ContributionsListViewModel.swift
//  GitHubContributions
//
//  Created by Ander Goig on 07/02/2021.
//

import Foundation

final class ContributionsListViewModel: ObservableObject {

    @Published private(set) var contributions: [ContributionsRowViewModel]

    init() {
        let usernames: [String]? = UserDefaults.standard.codable(forKey: "usernames")
        contributions = usernames?.map(ContributionsRowViewModel.init) ?? []
    }

    func addContributions(from username: String) {
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        contributions.append(.init(username: username))
        updateStorage()
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
        UserDefaults.standard.set(value: contributions.map(\.username), forKey: "usernames")
    }

}
