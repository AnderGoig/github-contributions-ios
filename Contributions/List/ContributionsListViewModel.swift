//
//  ContributionsListViewModel.swift
//  Contributions
//
//  Created by Ander Goig on 07/02/2021.
//

import Foundation

@MainActor
final class ContributionsListViewModel: ObservableObject {
    // MARK: - Properties

    private let storage: ContributionsStorage
    @Published private(set) var contributions: [ContributionsRowViewModel] = []

    // MARK: - Init

    init(storage: ContributionsStorage) {
        self.storage = storage
    }

    // MARK: - Inputs

    @Sendable func loadContributions() async {
        guard contributions.isEmpty else { return }
        contributions = await storage.usernames.map(ContributionsRowViewModel.init)
    }

    func addContributions(from username: String) async {
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        guard !contributions.contains(where: { $0.username.lowercased() == username.lowercased() }) else { return }
        contributions.append(.init(username: username))
        await updateStorage()
    }

    func removeContributions(_ contribution: ContributionsRowViewModel) async {
        contributions.removeAll { $0.username == contribution.username }
        await updateStorage()
    }

    // MARK: - Private Methods

    private func updateStorage() async {
        await storage.setUsernames(contributions.map(\.username))
    }
}
