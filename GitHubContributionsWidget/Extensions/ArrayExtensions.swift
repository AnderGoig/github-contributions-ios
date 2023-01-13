//
//  ArrayExtensions.swift
//  GitHubContributionsWidget
//
//  Created by Ander Goig on 18/10/2020.
//

// MARK: - Methods

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
