//
//  WidgetIntentConfiguration.swift
//  Contributions
//
//  Created by Ander Goig on 14/8/25.
//

import Foundation

struct WidgetIntentConfiguration: Sendable {
    let username: String?
    let theme: WidgetIntentTheme
    let isPureBlackEnabled: Bool

    init(_ intent: ConfigurationIntent) {
        self.username = intent.username
        self.theme = WidgetIntentTheme(theme: intent.theme)
        self.isPureBlackEnabled = intent.pureBlack?.boolValue ?? false
    }
}
