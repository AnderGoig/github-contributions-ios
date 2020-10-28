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

    private static var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()

    // MARK: - Public Methods

    public static func getContributions(for username: String) -> Future<[Contribution], Error> {
        Future { promise in
            do {
                let url = try contributionsURL(for: username)
                let html = try String(contentsOf: url, encoding: .utf8)
                let document = try SwiftSoup.parse(html)
                let defaultColors = try colors(from: document)
                let contributions = try document.select("rect").compactMap { try contribution(from: $0, colors: defaultColors) }
                promise(.success(contributions))
            } catch {
                promise(.failure(error))
            }
        }
    }

    // MARK: - Private Methods

    private static func contributionsURL(for username: String) throws -> URL {
        guard let url = URL(string: "https://github.com/users/\(username)/contributions") else { throw URLError(.badURL) }
        return url
    }

    private static func colors(from document: Document) throws -> [String] {
        try document.getElementsByClass("legend").first()?.children().map { try $0.attr("style") } ?? []
    }

    private static func contribution(from element: Element, colors: [String]) throws -> Contribution? {
        let fill = try element.attr("fill")
        let dataCount = try element.attr("data-count")
        let dataDate = try element.attr("data-date")

        guard let colorIndex = colors.firstIndex(where: { $0.contains(fill) }),
              let count = Int(dataCount),
              let date = dateFormatter.date(from: dataDate)
        else { return nil }

        return Contribution(date: date, count: count, level: Contribution.Level(rawValue: colorIndex) ?? .zero)
    }

}
