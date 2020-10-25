//
//  GridStack.swift
//  InterfaceKit
//
//  Created by Ander Goig on 17/10/2020.
//

import SwiftUI

struct GridStack<Content: View>: View {

    let rows: Int
    let columns: Int
    let spacing: CGFloat?
    let content: (Int, Int) -> Content

    var body: some View {
        HStack(alignment: .center, spacing: spacing) {
            ForEach(0 ..< columns, id: \.self) { row in
                VStack(alignment: .center, spacing: spacing) {
                    ForEach(0 ..< rows, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }

    init(rows: Int, columns: Int, spacing: CGFloat? = nil, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.spacing = spacing
        self.content = content
    }

}
