//
//  TextCaption.swift
//  InterfaceKit
//
//  Created by Ander Goig on 18/10/2020.
//

import SwiftUI

struct TextCaption: ViewModifier {

    func body(content: Content) -> some View {
        content
            .font(.caption2)
            .foregroundColor(.secondary)
            .textCase(.uppercase)
            .lineLimit(1)
    }

}

// MARK: - Convenience

extension View {

    func captionStyle() -> some View {
        modifier(TextCaption())
    }

}
