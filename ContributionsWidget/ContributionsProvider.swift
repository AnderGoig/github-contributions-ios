//
//  ContributionsProvider.swift
//  ContributionsWidget
//
//  Created by Ander Goig on 19/10/2020.
//

import NetworkKit
import WidgetKit

final class ContributionsProvider: IntentTimelineProvider {
    // MARK: - Types

    public typealias Entry = ContributionsViewModel

    // MARK: - Properties

    private var timelineTask: Task<Void, Error>?

    // MARK: - Methods

    func placeholder(in context: Context) -> Entry {
        let currentDate = Date.now
        let dateRange = Calendar.current.date(byAdding: .year, value: -1, to: currentDate)?.range(to: currentDate) ?? []
        let contributions = dateRange.map { GitHub.Contribution(date: $0, level: .zero) }
        let configuration = WidgetIntentConfiguration(ConfigurationIntent())
        return Entry(contributions: contributions, configuration: configuration)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Entry) -> Void) {
        let currentDate = Date.now
        let dateRange = Calendar.current.date(byAdding: .year, value: -1, to: currentDate)?.range(to: currentDate) ?? []
        let contributions = dateRange.map { GitHub.Contribution(date: $0, level: .random()) }
        let configuration = WidgetIntentConfiguration(configuration)
        completion(Entry(contributions: contributions, configuration: configuration))
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping @Sendable (Timeline<Entry>) -> Void) {
        let currentDate = Date.now
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 5, to: currentDate)!
        let username = configuration.username?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let configuration = WidgetIntentConfiguration(configuration)
        timelineTask = Task {
            let contributions = try? await GitHub.getContributions(for: username)
            let timeline = Timeline(entries: [Entry(contributions: contributions ?? [], configuration: configuration)], policy: .after(refreshDate))
            completion(timeline)
        }
    }
}

// MARK: -

extension ContributionsViewModel: TimelineEntry {
    var date: Date {
        lastContributionDate ?? .now
    }
}
