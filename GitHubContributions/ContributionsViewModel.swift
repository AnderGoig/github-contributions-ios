//
//  SettingsViewModel.swift
//  GitHubContributions
//
//  Created by Ander Goig on 20/10/2020.
//

import Foundation
import Combine
import NetworkKit

final class SettingsViewModel: ObservableObject {

    @Published private(set) var contributionLevels: [[GitHub.Contribution.Level]] = []
    @Published private(set) var username = "AnderGoig" // TODO: ...

    let rowsCount = 7
    let columnsCount = 20

    private var cancellables = Set<AnyCancellable>()
    private let queue = DispatchQueue(label: "com.andergoig.GitHubContributions.network")

    var rateURL: URL { // TODO: CHANGE!
        URL(string: "itms-apps://apps.apple.com/app/id1336038164?action=write-review&mt=8")!
    }

    var shareURL: URL { // TODO: CHANGE!
        URL(string: "itms-apps://apps.apple.com/app/id1336038164")!
    }

    var feedbackURL: URL {
        URL(string: "mailto:goig.ander@icloud.com")!
    }

    var openSourceURL: URL {
        URL(string: "https://github.com/AnderGoig/GitHubContributions")!
    }

    func fetchContributions() {
        GitHub.getContributions(for: username)
            .map(contributionLevels)
            .replaceError(with: [])
            .subscribe(on: queue)
            .receive(on: DispatchQueue.main)
            .assign(to: \.contributionLevels, on: self)
            .store(in: &cancellables)
    }

    private func contributionLevels(from contributions: [GitHub.Contribution]) -> [[GitHub.Contribution.Level]] {
        let tilesCount = rowsCount * columnsCount - (rowsCount - Calendar.current.component(.weekday, from: contributions.last?.date ?? Date()))
        return contributions.suffix(tilesCount).map(\.level).chunked(into: rowsCount)
    }

}

extension Array { // TODO: Is repeated in widget extension as well

    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }

}
