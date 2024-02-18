//
//  Tile.swift
//  InterfaceKit
//
//  Created by Ander Goig on 18/10/2020.
//

import SwiftUI

struct Tile: ViewModifier {
    let cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous).stroke(Color.tileBorder, lineWidth: 1))
            .cornerRadius(cornerRadius)
    }
}

// MARK: - Convenience

extension View {
    func tileStyle(cornerRadius: CGFloat = 2) -> some View {
        modifier(Tile(cornerRadius: cornerRadius))
    }
}
