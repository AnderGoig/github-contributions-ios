//
//  ContributionsRow.swift
//  GitHubContributions
//
//  Created by Ander Goig on 24/10/2020.
//

import InterfaceKit
import SwiftUI

struct ContributionsRow: View {
    @Environment(\.openURL) var openURL
    @ObservedObject var viewModel: ContributionsRowViewModel

    var body: some View {
        ContributionsView(
            rowsCount: ContributionsRowViewModel.rowsCount,
            columnsCount: ContributionsRowViewModel.columnsCount,
            colors: viewModel.contributions.levels.map { $0.map(\.color) },
            topLeadingText: viewModel.username,
            emptyText: NSLocalizedString("contributions-loading", comment: "")
        )
        .frame(height: 136)
        .padding(.vertical, 12)
        .onTapGesture(perform: onTap)
        .onAppear(perform: viewModel.getContributions)
    }

    private func onTap() {
        if let accountURL = viewModel.gitHubAccountURL {
            openURL(accountURL)
        }
    }
}
