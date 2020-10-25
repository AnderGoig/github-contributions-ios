//
//  GitHub.swift
//  NetworkKit
//
//  Created by Ander Goig on 15/10/2020.
//

import Foundation
import Combine

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
                let pattern = "(fill=\")(#[^\"]{6})(\" data-count=\")([^\"]{1,})(\" data-date=\")([^\"]{10})(\"/>)"
                let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
                let matches = regex.matches(in: html, options: [], range: NSRange(location: 0, length: html.count))
                let contributions = matches.compactMap { contribution(from: $0, in: html as NSString) }
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

    private static func contribution(from match: NSTextCheckingResult, in html: NSString) -> Contribution? {
        let fill = html.substring(with: match.range(at: 2))
        let dataCount = html.substring(with: match.range(at: 4))
        let dataDate = html.substring(with: match.range(at: 6))
        guard let count = Int(dataCount), let date = dateFormatter.date(from: dataDate) else { return nil }
        return Contribution(date: date, count: count, level: .init(hexColor: fill))
    }

}
