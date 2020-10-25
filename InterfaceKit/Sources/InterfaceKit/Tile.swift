//
//  Tile.swift
//  InterfaceKit
//
//  Created by Ander Goig on 18/10/2020.
//

import SwiftUI

struct Tile: ViewModifier {

    func body(content: Content) -> some View {
        content
            .overlay(RoundedRectangle(cornerRadius: 2.0, style: .continuous).stroke(Color.tileBorder, lineWidth: 1.0))
            .cornerRadius(2.0)
    }

}

// MARK: - Convenience

extension View {

    func tileStyle() -> some View {
        self.modifier(Tile())
    }

}
