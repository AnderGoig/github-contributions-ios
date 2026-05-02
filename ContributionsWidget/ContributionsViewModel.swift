//
//  ContributionsViewModel.swift
//  ContributionsWidget
//
//  Created by Ander Goig on 23/10/2020.
//

import Foundation
import NetworkKit

@dynamicMemberLookup
struct ContributionsViewModel {
    // MARK: - Properties

    private let contributions: [GitHub.Contribution]
    private let configuration: WidgetIntentConfiguration

    // MARK: - Outputs

    subscript<T>(dynamicMember keyPath: KeyPath<WidgetIntentConfiguration, T>) -> T {
        configuration[keyPath: keyPath]
    }

    var showPlaceholders: Bool {
        contributions.isEmpty
    }

    var topLeadingText: String? {
        configuration.username
    }

    var showError: Bool {
        configuration.username != .none && contributions.isEmpty
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

    init(contributions: [GitHub.Contribution], configuration: WidgetIntentConfiguration) {
        self.contributions = contributions
        self.configuration = configuration
    }
}
