//
//  ThemeExtensions.swift
//  GitHubContributionsWidgetExtension
//
//  Created by Ander Goig on 20/10/2020.
//

import NetworkKit
import SwiftUI

extension Theme {
    func color(for level: GitHub.Contribution.Level) -> Color {
        switch level {
        case .zero: return Color.emptyTile
        case .first: return firstLevelColor
        case .second: return secondLevelColor
        case .third: return thirdLevelColor
        case .fourth: return fourthLevelColor
        }
    }

    var firstLevelColor: Color {
        switch self {
        case .unknown: return .greenLevel1
        case .green: return .greenLevel1
        case .blue: return .blueLevel1
        case .red: return .redLevel1
        case .purple: return .purpleLevel1
        case .yellow: return .yellowLevel1
        case .invert: return .invertLevel1
        }
    }

    var secondLevelColor: Color {
        switch self {
        case .unknown: return .greenLevel2
        case .green: return .greenLevel2
        case .blue: return .blueLevel2
        case .red: return .redLevel2
        case .purple: return .purpleLevel2
        case .yellow: return .yellowLevel2
        case .invert: return .invertLevel2
        }
    }

    var thirdLevelColor: Color {
        switch self {
        case .unknown: return .greenLevel3
        case .green: return .greenLevel3
        case .blue: return .blueLevel3
        case .red: return .redLevel3
        case .purple: return .purpleLevel3
        case .yellow: return .yellowLevel3
        case .invert: return .invertLevel3
        }
    }

    var fourthLevelColor: Color {
        switch self {
        case .unknown: return .greenLevel4
        case .green: return .greenLevel4
        case .blue: return .blueLevel4
        case .red: return .redLevel4
        case .purple: return .purpleLevel4
        case .yellow: return .yellowLevel4
        case .invert: return .invertLevel4
        }
    }
}
