//
//  SettingsRow.swift
//  GitHubContributions
//
//  Created by Ander Goig on 22/10/2020.
//

import SwiftUI

struct SettingsRow: View {

    let item: SettingsItem

    var body: some View {
        Label {
            VStack(alignment: .leading, spacing: 3.0) {
                Text(item.title)
                    .font(.body)
                    .foregroundColor(.primary)

                Text(item.subtitle)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .tint(.secondary)
            }
        } icon: {
            Image(systemName: item.systemImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 17.0, height: 17.0)
                .padding(6.0)
                .background(item.color)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 6.0, style: .continuous))
        }
        .labelStyle(SettingsLabelStyle())
        .padding(.vertical, 4.0)
        .lineLimit(1)
    }

}

// MARK: -

struct SettingsLabelStyle: LabelStyle {

    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 12.0) {
            configuration.icon
            configuration.title
        }
    }

}
