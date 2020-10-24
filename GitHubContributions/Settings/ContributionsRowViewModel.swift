//
//  ContributionsRowViewModel.swift
//  GitHubContributions
//
//  Created by Ander Goig on 24/10/2020.
//

import Foundation
import NetworkKit

struct ContributionsRowViewModel {
    let rowsCount = 7
    let columnsCount = 20
    let contributionLevels: [[GitHub.Contribution.Level]]
    let username: String
}
