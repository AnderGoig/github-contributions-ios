//
//  GitHubContributionsViewModel.swift
//  GitHubContributionsWidget
//
//  Created by Ander Goig on 23/10/2020.
//

import Foundation
import NetworkKit

struct GitHubContributionsViewModel {
    // MARK: - Properties

    private let contributions: [GitHub.Contribution]
    private let configuration: ConfigurationIntent

    // MARK: - Outputs

    var theme: Theme {
        configuration.theme
    }

    var isPureBlackEnabled: Bool {
        configuration.pureBlack?.boolValue ?? false
    }

    var username: String? {
        configuration.username
    }

    var showPlaceholders: Bool {
        contributions.isEmpty
    }

    var topLeadingText: String? {
        username
    }

    var showError: Bool {
        username != .none && contributions.isEmpty
    }

    var lastContributionDate: Date? {
        contributions.last?.date
    }

    func contributionLevels(rowsCount: Int, columnsCount: Int) -> [[GitHub.Contribution.Level]] {
        guard let lastDate = lastContributionDate else { return [] }
        let tilesCount = rowsCount * columnsCount - (rowsCount - Calendar.current.component(.weekday, from: lastDate))
        return contributions.suffix(tilesCount).map(\.level).chunked(into: rowsCount)
    }

    // MARK: - Init

    init(contributions: [GitHub.Contribution], configuration: ConfigurationIntent) {
        self.contributions = contributions
        self.configuration = configuration
    }
}
