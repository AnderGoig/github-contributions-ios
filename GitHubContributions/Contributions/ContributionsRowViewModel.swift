//
//  ContributionsRowViewModel.swift
//  GitHubContributions
//
//  Created by Ander Goig on 24/10/2020.
//

import Foundation
import NetworkKit

@MainActor
final class ContributionsRowViewModel: ObservableObject {
    // MARK: - Types

    struct Contributions {
        var levels: [[GitHub.Contribution.Level]] = []
    }

    // MARK: - Properties

    static let rowsCount = 7
    static let columnsCount = 20

    let username: String
    @Published private(set) var contributions = Contributions()

    var gitHubAccountURL: URL? {
        URL(string: "https://github.com/\(username)")
    }

    // MARK: - Init

    init(username: String) {
        self.username = username
    }

    // MARK: - Inputs

    @Sendable func loadContributions() async {
        guard contributions.levels.isEmpty else { return }
        let gitHubContributions = try? await GitHub.getContributions(for: username)
        contributions = gitHubContributions.map(Self.mapContributions) ?? Contributions()
    }

    // MARK: - Private Methods

    private static func mapContributions(_ contributions: [GitHub.Contribution]) -> Contributions {
        guard let lastDate = contributions.last?.date else { return Contributions() }
        let tilesCount = rowsCount * columnsCount - (rowsCount - Calendar.current.component(.weekday, from: lastDate))
        let levels = contributions.suffix(tilesCount).map(\.level).chunked(into: rowsCount)
        return Contributions(levels: levels)
    }
}

// MARK: -

private extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
