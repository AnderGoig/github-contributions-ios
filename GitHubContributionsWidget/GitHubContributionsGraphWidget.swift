//
//  GitHubContributionsGraphWidget.swift
//  GitHubContributionsWidget
//
//  Created by Ander Goig on 19/10/2020.
//

import Intents
import SwiftUI
import WidgetKit

struct GitHubContributionsGraphWidget: Widget {

    let kind: String = "GitHubContributionsGraphWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: GitHubContributionsProvider()) { entry in
            GitHubContributionsGraphEntryView(entry: entry)
        }
        .configurationDisplayName(LocalizedStringKey("widget-graph-display-name"))
        .description(LocalizedStringKey("widget-graph-description"))
        .supportedFamilies([.systemSmall, .systemMedium])
    }

}
