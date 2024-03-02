//
//  GitHubContributionsGraphEntryView.swift
//  GitHubContributionsWidget
//
//  Created by Ander Goig on 23/10/2020.
//

import SwiftUI

struct GitHubContributionsGraphEntryView: View {
    @Environment(\.widgetFamily) var widgetFamily
    let entry: GitHubContributionsViewModel

    var body: some View {
        if entry.showError {
            Text("contributions-fetch-error")
                .font(.callout)
                .multilineTextAlignment(.center)
                .modifier(WidgetStyle(isPureBlackEnabled: entry.isPureBlackEnabled))
        } else {
            switch widgetFamily {
            case .systemSmall:
                GitHubContributionsGraphWidgetView(viewModel: entry, rowsCount: 7, columnsCount: 9)
                    .modifier(WidgetStyle(isPureBlackEnabled: entry.isPureBlackEnabled))
            case .systemMedium:
                GitHubContributionsGraphWidgetView(viewModel: entry, rowsCount: 7, columnsCount: 20)
                    .modifier(WidgetStyle(isPureBlackEnabled: entry.isPureBlackEnabled))
            default:
                EmptyView()
            }
        }
    }
}

// MARK: -


// fix "please adopt containerbackground api" in widget after ios 17.0; ref-> https://stackoverflow.com/a/76842922/8262079
extension View {
    func widgetBackground(_ backgroundView: some View) -> some View {
        if #available(iOSApplicationExtension 17.0, *) {
            return containerBackground(for: .widget) {
                backgroundView
            }
        } else {
            return background(backgroundView)
        }
    }
}


struct WidgetStyle: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    let isPureBlackEnabled: Bool

    var backgroundColor: Color {
        colorScheme == .dark && isPureBlackEnabled ? .black : .widgetBackground
    }

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .widgetBackground(backgroundColor)
    }
}
