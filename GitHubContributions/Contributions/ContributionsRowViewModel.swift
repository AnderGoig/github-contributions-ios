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

    let rowsCount = 7
    let columnsCount = 20
    let username: String

    @Published private(set) var contributions: (levels: [[GitHub.Contribution.Level]], count: Int) = ([], 0)

    private let queue = DispatchQueue(label: "com.andergoig.GitHubContributions.network")

    init(username: String) {
        self.username = username
    }

    func getContributions() {
        guard contributions.levels.isEmpty else { return }

        GitHub.getContributions(for: username, queue: queue)
            .subscribe(on: queue)
            .replaceError(with: [])
            .map(contributions)
            .receive(on: DispatchQueue.main)
            .assign(to: &$contributions)
    }

    private func contributions(from contributions: [GitHub.Contribution]) -> ([[GitHub.Contribution.Level]], Int) {
        guard let lastData = contributions.last?.date else { return ([], 0) }
        let tilesCount = rowsCount * columnsCount - (rowsCount - Calendar.current.component(.weekday, from: lastData))
        let levels = contributions.suffix(tilesCount).map(\.level).chunked(into: rowsCount)
        let count = contributions.reduce(0) { $0 + $1.count }
        return (levels, count)
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
