//
//  Tile.swift
//  InterfaceKit
//
//  Created by Ander Goig on 18/10/2020.
//

import SwiftUI
import WidgetKit

struct Tile: ViewModifier {
    // MARK: - Properties

    let cornerRadius: CGFloat

    @Environment(\.widgetRenderingMode)
    private var widgetRenderingMode

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .overlay(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous).stroke(Color.tileBorder, lineWidth: 1))
            .cornerRadius(cornerRadius)
            .accented(widgetRenderingMode == .accented)
    }
}

// MARK: - Convenience

extension View {
    func tileStyle(cornerRadius: CGFloat = 2) -> some View {
        modifier(Tile(cornerRadius: cornerRadius))
    }

    @ViewBuilder
    func accented(_ isAccented: Bool = true) -> some View {
        if isAccented {
            self.luminanceToAlpha().widgetAccentable(true)
        } else {
            self
        }
    }
}
