//
//  WidgetIntentTheme.swift
//  Contributions
//
//  Created by Ander Goig on 14/8/25.
//

import NetworkKit
import SwiftUI

enum WidgetIntentTheme: Int, Sendable {
    case unknown
    case green
    case blue
    case red
    case purple
    case yellow
    case inverted

    init(theme: Theme) {
        switch theme {
        case .unknown: self = .unknown
        case .green: self = .green
        case .blue: self = .blue
        case .red: self = .red
        case .purple: self = .purple
        case .yellow: self = .yellow
        case .inverted: self = .inverted
        }
    }

    func color(for level: GitHub.Contribution.Level) -> Color {
        switch level {
        case .zero: return .tileEmpty
        case .first: return firstLevelColor
        case .second: return secondLevelColor
        case .third: return thirdLevelColor
        case .fourth: return fourthLevelColor
        }
    }

    private var firstLevelColor: Color {
        switch self {
        case .unknown: return .greenLevel1
        case .green: return .greenLevel1
        case .blue: return .blueLevel1
        case .red: return .redLevel1
        case .purple: return .purpleLevel1
        case .yellow: return .yellowLevel1
        case .inverted: return .invertedLevel1
        }
    }

    private var secondLevelColor: Color {
        switch self {
        case .unknown: return .greenLevel2
        case .green: return .greenLevel2
        case .blue: return .blueLevel2
        case .red: return .redLevel2
        case .purple: return .purpleLevel2
        case .yellow: return .yellowLevel2
        case .inverted: return .invertedLevel2
        }
    }

    private var thirdLevelColor: Color {
        switch self {
        case .unknown: return .greenLevel3
        case .green: return .greenLevel3
        case .blue: return .blueLevel3
        case .red: return .redLevel3
        case .purple: return .purpleLevel3
        case .yellow: return .yellowLevel3
        case .inverted: return .invertedLevel3
        }
    }

    private var fourthLevelColor: Color {
        switch self {
        case .unknown: return .greenLevel4
        case .green: return .greenLevel4
        case .blue: return .blueLevel4
        case .red: return .redLevel4
        case .purple: return .purpleLevel4
        case .yellow: return .yellowLevel4
        case .inverted: return .invertedLevel4
        }
    }
}
