//
//  ContributionsGraphEntryView.swift
//  ContributionsWidget
//
//  Created by Ander Goig on 23/10/2020.
//

import SwiftUI

struct ContributionsGraphEntryView: View {
    // MARK: - Properties

    @Environment(\.widgetFamily) var widgetFamily
    let entry: ContributionsViewModel

    // MARK: - Init

    var body: some View {
        if entry.showError {
            Text("contributions-fetch-error")
                .font(.callout)
                .multilineTextAlignment(.center)
                .modifier(WidgetStyle(isPureBlackEnabled: entry.isPureBlackEnabled))
        } else {
            switch widgetFamily {
            case .systemSmall:
                ContributionsGraphWidgetView(viewModel: entry, rowsCount: 7, columnsCount: 9)
                    .modifier(WidgetStyle(isPureBlackEnabled: entry.isPureBlackEnabled))
            case .systemMedium:
                ContributionsGraphWidgetView(viewModel: entry, rowsCount: 7, columnsCount: 20)
                    .modifier(WidgetStyle(isPureBlackEnabled: entry.isPureBlackEnabled))
            default:
                EmptyView()
            }
        }
    }
}

// MARK: -

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

// MARK: -

struct WidgetStyle: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    let isPureBlackEnabled: Bool

    var backgroundColor: Color {
        colorScheme == .dark && isPureBlackEnabled ? .black : .backgroundSecondary
    }

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .widgetBackground(backgroundColor)
    }
}
