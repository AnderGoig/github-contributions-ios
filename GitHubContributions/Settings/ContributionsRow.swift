//
//  ContributionsRow.swift
//  GitHubContributions
//
//  Created by Ander Goig on 24/10/2020.
//

import SwiftUI
import InterfaceKit

struct ContributionsRow: View {

    var viewModel: ContributionsRowViewModel

    var body: some View {
        ContributionsView(
            rowsCount: viewModel.rowsCount,
            columnsCount: viewModel.columnsCount,
            colors: viewModel.contributionLevels.map { $0.map(\.color) },
            topLeadingText: viewModel.username,
            topTrailingText: .localizedStringWithFormat(NSLocalizedString("contributions-count", comment: ""), viewModel.contributionLevels.count)
        )
        .frame(height: 136.0, alignment: .center)
        .padding(.vertical, 12.0)
    }

}
