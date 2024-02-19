//
//  ContributionsView.swift
//  InterfaceKit
//
//  Created by Ander Goig on 19/10/2020.
//

import SwiftUI

public struct ContributionsView: View {
    @Environment(\.redactionReasons) var redactionReasons

    let rowsCount: Int
    let columnsCount: Int
    let colors: [[Color]]
    let topLeadingText: String?
    let topTrailingText: String?
    let emptyText: String?

    private let tileSpacing: CGFloat = 3.0

    public var body: some View {
        VStack {
            HStack {
                HStack(spacing: 6) {
                    Image("GitHubMark", bundle: .module)
                        .resizable()
                        .frame(width: 12, height: 12)
                        .unredacted()
                    topLeadingText.map(Text.init)
                }
                Spacer()
                topTrailingText.map(Text.init)
            }
            .captionStyle()

            Spacer()

            if colors.isEmpty {
                Label(emptyText ?? "", systemImage: "info.circle")
                    .font(.callout.weight(.semibold))
                    .foregroundColor(.blue)
                    .unredacted()
                Spacer()
            } else {
                GeometryReader { geometry in
                    let tileSize = (geometry.size.width - CGFloat(columnsCount - 1) * tileSpacing) / CGFloat(columnsCount)
                    GridStack(rows: rowsCount, columns: columnsCount, spacing: tileSpacing) { row, column in
                        (colors.element(at: row)?.element(at: column) ?? .clear)
                            .frame(width: tileSize, height: tileSize)
                            .tileStyle()
                    }
                    .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
                }
            }
        }
    }

    public init(
        rowsCount: Int,
        columnsCount: Int,
        colors: [[Color]],
        topLeadingText: String? = nil,
        topTrailingText: String? = nil,
        emptyText: String? = nil
    ) {
        self.rowsCount = rowsCount
        self.columnsCount = columnsCount
        self.colors = colors
        self.topLeadingText = topLeadingText
        self.topTrailingText = topTrailingText
        self.emptyText = emptyText
    }
}
