//
//  Contribution.swift
//  NetworkKit
//
//  Created by Ander Goig on 18/10/2020.
//

import Foundation

public extension GitHub {
    struct Contribution {
        /// The date when the contributions occurred.
        public let date: Date

        /// Number of contributions.
        public let count: Int

        /// Level of contributions.
        public let level: Level

        /// Constants that indicate the amount of contributions.
        /// Level `.zero` means zero contributions.
        public enum Level: Int, CaseIterable {
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

public extension CaseIterable {
    /// Returns a random element of the collection.
    static func random() -> Self {
        allCases.randomElement()!
    }
}
