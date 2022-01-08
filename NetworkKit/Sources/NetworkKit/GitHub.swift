//
//  GitHub.swift
//  NetworkKit
//
//  Created by Ander Goig on 15/10/2020.
//

import Foundation
import Combine
import SwiftSoup

public struct GitHub {

    // MARK: - Private Properties

    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()

    // MARK: - Public Methods

    public static func getContributions(for username: String, queue: DispatchQueue) -> Future<[Contribution], Error> {
        Future { promise in
            queue.async {
                do {
                    let url = try contributionsURL(for: username)
                    let html = try String(contentsOf: url, encoding: .utf8)
                    let document = try SwiftSoup.parse(html)
                    let contributions = try document.select("rect").compactMap(contribution)
                    promise(.success(contributions))
                } catch {
                    promise(.failure(error))
                }
            }
        }
    }

    // MARK: - Private Methods

    private static func contributionsURL(for username: String) throws -> URL {
        guard let url = URL(string: "https://github.com/users/\(username)/contributions") else { throw URLError(.badURL) }
        return url
    }

    private static func contribution(from htmlElement: Element) throws -> Contribution? {
        let dataCount = try htmlElement.attr("data-count")
        let dataDate = try htmlElement.attr("data-date")
        let dataLevel = try htmlElement.attr("data-level")

        guard let level = Int(dataLevel),
              let count = Int(dataCount),
              let date = dateFormatter.date(from: dataDate)
        else { return nil }

        return Contribution(date: date, count: count, level: Contribution.Level(rawValue: level) ?? .zero)
    }

}
