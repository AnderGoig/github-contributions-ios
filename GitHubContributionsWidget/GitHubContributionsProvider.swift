//
//  GitHubContributionsProvider.swift
//  GitHubContributionsWidget
//
//  Created by Ander Goig on 19/10/2020.
//

import Combine
import WidgetKit
import NetworkKit

final class GitHubContributionsProvider: IntentTimelineProvider {

    public typealias Entry = GitHubContributionsViewModel

    private var timelineCancellable: AnyCancellable?
    private let queue = DispatchQueue(label: "com.andergoig.GitHubContributionsWidget.network")

    func placeholder(in context: Context) -> Entry {
        let currentDate = Date.now
        let dateRange = Calendar.current.date(byAdding: .year, value: -1, to: currentDate)?.range(to: currentDate) ?? []
        let contributions = dateRange.map { GitHub.Contribution(date: $0, count: 0, level: .zero) }
        return Entry(contributions: contributions, configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Entry) -> Void) {
        let currentDate = Date.now
        let dateRange = Calendar.current.date(byAdding: .year, value: -1, to: currentDate)?.range(to: currentDate) ?? []
        let contributions = dateRange.map { GitHub.Contribution(date: $0, count: .random(in: 0...20), level: .random()) }
        completion(Entry(contributions: contributions, configuration: configuration))
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        let currentDate = Date.now
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 5, to: currentDate)!
        let username = configuration.username?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        timelineCancellable = GitHub.getContributions(for: username, queue: queue)
            .subscribe(on: queue)
            .map { Timeline(entries: [Entry(contributions: $0, configuration: configuration)], policy: .after(refreshDate)) }
            .replaceError(with: Timeline(entries: [Entry(contributions: [], configuration: configuration)], policy: .after(refreshDate)))
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: completion)
    }

}

// MARK: -

extension GitHubContributionsViewModel: TimelineEntry {

    var date: Date {
        lastContributionDate ?? .now
    }

}

// MARK: -

private extension GitHub.Contribution.Level {

    static func random() -> Self {
        allCases.randomElement()!
    }

}
