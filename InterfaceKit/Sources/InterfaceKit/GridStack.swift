//
//  GridStack.swift
//  InterfaceKit
//
//  Created by Ander Goig on 17/10/2020.
//

import SwiftUI

struct GridStack<Content: View>: View {
    // MARK: - Properties

    var rows: Int
    var columns: Int
    var spacing: CGFloat?

    @ViewBuilder
    var content: (Int, Int) -> Content

    // MARK: - View

    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0 ..< columns, id: \.self) { row in
                VStack(spacing: spacing) {
                    ForEach(0 ..< rows, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}
