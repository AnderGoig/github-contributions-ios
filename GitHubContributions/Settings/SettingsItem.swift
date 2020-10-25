//
//  SettingsItem.swift
//  GitHubContributions
//
//  Created by Ander Goig on 22/10/2020.
//

import SwiftUI

enum SettingsItem: Int {

    case widgetGuide, rate, share, feedback, openSource

    var title: LocalizedStringKey {
        switch self {
        case .widgetGuide: return "settings-row-widget-guide-title"
        case .rate: return "settings-row-rate-title"
        case .share: return "settings-row-share-title"
        case .feedback: return "settings-row-feedback-title"
        case .openSource: return "settings-row-open-source-title"
        }
    }

    var subtitle: LocalizedStringKey {
        switch self {
        case .widgetGuide: return "settings-row-widget-guide-subtitle"
        case .rate: return "settings-row-rate-subtitle"
        case .share: return "settings-row-share-subtitle"
        case .feedback: return "settings-row-feedback-subtitle"
        case .openSource: return "settings-row-open-source-subtitle"
        }
    }

    var systemImageName: String {
        switch self {
        case .widgetGuide: return "questionmark"
        case .rate: return "star.fill"
        case .share: return "square.and.arrow.up"
        case .feedback: return "at"
        case .openSource: return "swift"
        }
    }

    var color: Color {
        switch self {
        case .widgetGuide: return .blue
        case .rate: return .pink
        case .share: return .green
        case .feedback: return .blue
        case .openSource: return .orange
        }
    }

}
