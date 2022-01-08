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
                HStack(spacing: 6.0) {
                    Image("GitHubMark", bundle: .module)
                        .resizable()
                        .frame(width: 12.0, height: 12.0)
                        .unredacted()
                    topLeadingText.map(Text.init)
                }
                Spacer()
                topTrailingText.map(Text.init)
            }
            .captionStyle()

            if colors.isEmpty {
                Spacer()
                Label(emptyText ?? "", systemImage: "info.circle")
                    .font(.callout.weight(.semibold))
                    .foregroundColor(.blue)
                    .unredacted()
                Spacer()
            } else {
                GridStack(rows: rowsCount, columns: columnsCount, spacing: tileSpacing) { row, column in
                    if let color = colors.element(at: row)?.element(at: column) {
                        color.tileStyle()
                    } else {
                        Color.clear
                    }
                }
            }
        }
    }

    public init(rowsCount: Int, columnsCount: Int, colors: [[Color]], topLeadingText: String? = nil, topTrailingText: String? = nil, emptyText: String? = nil) {
        self.rowsCount = rowsCount
        self.columnsCount = columnsCount
        self.colors = colors
        self.topLeadingText = topLeadingText
        self.topTrailingText = topTrailingText
        self.emptyText = emptyText
    }

}
