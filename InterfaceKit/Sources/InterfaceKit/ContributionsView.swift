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
        VStack(alignment: .center, spacing: nil) {
            HStack(alignment: .center, spacing: nil) {
                HStack(alignment: .center, spacing: 6.0) {
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
                Button(action: {}) {
                    Image(systemName: "info.circle")
                    emptyText.map(Text.init)
                }
                .font(.system(size: 16.0, weight: .semibold, design: .default))
                .foregroundColor(.blue)
                .frame(maxHeight: .infinity, alignment: .center)
                .unredacted()
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
