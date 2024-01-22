//
//  ContributionsRowViewModel.swift
//  GitHubContributions
//
//  Created by Ander Goig on 24/10/2020.
//

import Combine
import Foundation
import NetworkKit

final class ContributionsRowViewModel: ObservableObject {
    struct Contributions {
        var levels: [[GitHub.Contribution.Level]] = []
    }

    static let rowsCount = 7
    static let columnsCount = 20

    let username: String
    @Published private(set) var contributions: Contributions = .init()

    var gitHubAccountURL: URL? {
        URL(string: "https://github.com/\(username)")
    }

    private let queue = DispatchQueue(label: "com.andergoig.GitHubContributions.network")

    init(username: String) {
        self.username = username
    }

    func getContributions() {
        guard contributions.levels.isEmpty else { return }

        GitHub.getContributions(for: username, queue: queue)
            .subscribe(on: queue)
            .replaceError(with: [])
            .map(Self.mapContributions)
            .receive(on: DispatchQueue.main)
            .assign(to: &$contributions)
    }

    private static func mapContributions(_ contributions: [GitHub.Contribution]) -> Contributions {
        guard let lastDate = contributions.last?.date else { return .init() }
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
