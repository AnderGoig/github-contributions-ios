//
//  ContributionsListViewModel.swift
//  GitHubContributions
//
//  Created by Ander Goig on 07/02/2021.
//

import Foundation

final class ContributionsListViewModel: ObservableObject {
    // MARK: - Properties

    private let storage: ContributionsStorage

    @Published private(set) var contributions: [ContributionsRowViewModel] = []

    // MARK: - Init

    init(storage: ContributionsStorage) {
        self.storage = storage
        Task {
            contributions = await storage.usernames.map(ContributionsRowViewModel.init)
        }
    }

    // MARK: - Inputs

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

    // MARK: - Private Methods

    private func updateStorage() {
        Task(priority: .background) {
            await storage.setUsernames(contributions.map(\.username))
        }
    }
}
