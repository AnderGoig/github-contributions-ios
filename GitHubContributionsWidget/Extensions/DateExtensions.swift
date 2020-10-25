//
//  DateExtensions.swift
//  GitHubContributionsWidget
//
//  Created by Ander Goig on 18/10/2020.
//

import Foundation

// MARK: - Methods

extension Date {

    func range(to: Date) -> [Date] {
        var tempDate = self
        var array = [tempDate]
        while tempDate < to {
            tempDate = Calendar.current.date(byAdding: .day, value: 1, to: tempDate)!
            array.append(tempDate)
        }
        return array
    }

}
