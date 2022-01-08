//
//  Step.swift
//  GitHubContributions
//
//  Created by Ander Goig on 24/10/2020.
//

import Foundation

enum Step: Int, CaseIterable {

    case one = 1, two, three, four, five, six, seven

    var title: String {
        .localizedStringWithFormat(NSLocalizedString("widget-guide-step-%u-title", comment: ""), rawValue)
    }

    var subtitle: String {
        NSLocalizedString("widget-guide-step-\(rawValue)-subtitle", comment: "")
    }

    var lightImage: URL {
        URL(string: "https://raw.githubusercontent.com/AnderGoig/github-contributions-ios/develop/.assets/widgets-step-\(rawValue).png")!
    }

    var darkImage: URL {
        URL(string: "https://raw.githubusercontent.com/AnderGoig/github-contributions-ios/develop/.assets/widgets-step-dark-\(rawValue).png")!
    }

}
