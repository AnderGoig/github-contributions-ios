//
//  NetworkKitExtensions.swift
//  GitHubContributions
//
//  Created by Ander Goig on 22/10/2020.
//

import NetworkKit
import SwiftUI

extension GitHub.Contribution.Level {
    var color: Color {
        switch self {
        case .zero: return .emptyTile
        case .first: return .greenLevel1
        case .second: return .greenLevel2
        case .third: return .greenLevel3
        case .fourth: return .greenLevel4
        }
    }
}
