//
//  SettingsView.swift
//  GitHubContributions
//
//  Created by Ander Goig on 14/10/2020.
//

import SwiftUI
import NetworkKit
import InterfaceKit

struct SettingsItem: Identifiable {
    let title: String
    let subtitle: String
    let systemImageName: String
    let color: Color

    var id: String { title }
}

struct SettingsView: View {

    @State var contributions: [GitHub.Contribution]?

    private let topItems = [
        SettingsItem(title: "How to", subtitle: "How the f... do I?", systemImageName: "questionmark", color: .blue)
    ]

    private let bottomItems = [
        SettingsItem(title: "Review", subtitle: "Please review ...", systemImageName: "star.fill", color: .orange),
        SettingsItem(title: "Share", subtitle: "Please share ...", systemImageName: "square.and.arrow.up", color: .green)
    ]

    var header: some View {
        ContributionsView(
            colors: [[Color.red, Color.yellow]],
            rowsCount: 7,
            columnsCount: 20,
            topLeadingText: "AnderGoig",
            topTrailingText: "120 Contributions"
        )
        .frame(height: 120.0, alignment: .center)
        .padding()
        .background(Color("Background"))
        .cornerRadius(20.0)
        .listRowInsets(EdgeInsets(top: 24.0, leading: 0.0, bottom: 32.0, trailing: 0.0))
    }

    var body: some View {
        NavigationView {
            List {
                Section(header: header) {
                    ForEach(topItems) { item in
                        NavigationLink(destination: EmptyView()) {
                            SettingsRow(item: item)
                        }
                    }
                }

                Section(footer: footer) {
                    ForEach(bottomItems) { item in
                        NavigationLink(destination: EmptyView()) {
                            SettingsRow(item: item)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("GitHub Contributions", displayMode: .inline)
        }
        .onAppear(perform: fetchContributions)
    }

    var footer: some View {
        Text("Made by Ander Goig in Vienna")
            .textCase(.uppercase)
            .foregroundColor(.secondary)
            .font(.caption2)
            .frame(maxWidth: .infinity, alignment: .center)
            .listRowInsets(EdgeInsets(top: 24.0, leading: 0.0, bottom: 24.0, trailing: 0.0))
    }

    private func fetchContributions() {
        GitHub.getContributions(for: "AnderGoig") { result in
            switch result {
            case let .success(contributions):
                self.contributions = contributions
            case let .failure(error):
                print(error)
            }
        }
    }

}

struct SettingsRow: View {

    let item: SettingsItem

    var body: some View {
        HStack(alignment: .center, spacing: 16.0) {
            Image(systemName: item.systemImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 17.0, height: 17.0)
                .padding(6.0)
                .background(item.color)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 6.0, style: .continuous))

            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .foregroundColor(.primary)
                    .lineLimit(1)

                Text(item.subtitle)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
        }
        .padding(.vertical, 4.0)
    }

}
