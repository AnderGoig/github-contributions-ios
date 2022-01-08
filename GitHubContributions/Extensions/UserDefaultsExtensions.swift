//
//  UserDefaultsExtensions.swift
//  GitHubContributions
//
//  Created by Ander Goig on 07/02/2021.
//

import Foundation

extension UserDefaults {

    func set<Element: Codable>(value: Element, forKey key: String) {
        let data = try? JSONEncoder().encode(value)
        setValue(data, forKey: key)
    }

    func codable<Element: Codable>(forKey key: String) -> Element? {
        guard let data = data(forKey: key) else { return nil }
        return try? JSONDecoder().decode(Element.self, from: data)
    }

}
