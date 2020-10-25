//
//  GitHubContributionsEntryView.swift
//  GitHubContributionsWidget
//
//  Created by Ander Goig on 23/10/2020.
//

import SwiftUI

struct GitHubContributionsTilesEntryView: View {

    @Environment(\.widgetFamily) var widgetFamily
    let entry: GitHubContributionsViewModel

    var body: some View {
        if entry.showError {
            Text(LocalizedStringKey("contributions-fetch-error"))
                .font(.callout)
                .multilineTextAlignment(.center)
                .modifier(WidgetStyle())
        } else {
            switch widgetFamily {
            case .systemSmall:
                GitHubContributionsTilesWidgetView(viewModel: entry, rowsCount: 7, columnsCount: 9, showTrailingText: false)
                    .modifier(WidgetStyle())
            case .systemMedium:
                GitHubContributionsTilesWidgetView(viewModel: entry, rowsCount: 7, columnsCount: 20, showTrailingText: true)
                    .modifier(WidgetStyle())
            default:
                EmptyView()
            }
        }
    }

}

// MARK: -

struct WidgetStyle: ViewModifier {

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(Color.widgetBackground)
    }

}
