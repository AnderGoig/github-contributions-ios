//
//  Contribution.swift
//  NetworkKit
//
//  Created by Ander Goig on 18/10/2020.
//

import Foundation

extension GitHub {

    public struct Contribution {

        /// The date when the contributions ocurred.
        public let date: Date

        /// Number of contributions.
        public let count: Int

        /// Level of contributions.
        public let level: Level

        /// Constants that indicate the amount of contributions:
        /// Level `.zero` means zero contributions.
        public enum Level: CaseIterable {
            case zero, first, second, third, fourth
        }

        public init(date: Date, count: Int, level: Level) {
            self.date = date
            self.count = count
            self.level = level
        }

    }

}

// MARK: - Convenience

extension GitHub.Contribution.Level {

    /// Returns the corresponding level of contribution according to GitHub's default hex colors.
    /// - Parameter hexColor: String representing the hex color.
    init(hexColor: String) {
        switch hexColor.lowercased() {
        case "#9be9a8": self = .first
        case "#40c463": self = .second
        case "#30a14e": self = .third
        case "#216e39": self = .fourth
        default: self = .zero
        }
    }

}
