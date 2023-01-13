//
//  GitHubContributionsGraphWidgetView.swift
//  GitHubContributionsWidget
//
//  Created by Ander Goig on 23/10/2020.
//

import InterfaceKit
import SwiftUI

struct GitHubContributionsGraphWidgetView: View {
    let viewModel: GitHubContributionsViewModel
    let rowsCount: Int
    let columnsCount: Int
    let showTrailingText: Bool

    var body: some View {
        ContributionsView(
            rowsCount: rowsCount,
            columnsCount: columnsCount,
            colors: viewModel.contributionLevels(rowsCount: rowsCount, columnsCount: columnsCount).map { $0.map(viewModel.theme.color) },
            topLeadingText: viewModel.topLeadingText,
            topTrailingText: showTrailingText ? viewModel.topTrailingText : nil,
            emptyText: NSLocalizedString("contributions-empty-text", comment: "")
        )
        .redacted(reason: viewModel.showPlaceholders ? .placeholder : .init())
    }
}
