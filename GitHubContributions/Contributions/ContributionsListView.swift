//
//  ContributionsListView.swift
//  GitHubContributions
//
//  Created by Ander Goig on 06/02/2021.
//

import SwiftUI
import InterfaceKit

struct ContributionsListView: View {

    @State private var showsAlert = false
    @ObservedObject var viewModel: ContributionsListViewModel

    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.contributions.isEmpty {
                    emptyView
                } else {
                    listView
                }
            }
            .navigationTitle("app-title")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showsAlert = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .alert(isPresented: $showsAlert, addContributionsAlert)
    }

    private var emptyView: some View {
        VStack(alignment: .center, spacing: 6.0, content: {
            Text("contributions-empty-title")
                .font(.headline)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)

            Text("contributions-empty-subtitle")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        })
        .padding(EdgeInsets(top: 0.0, leading: 44.0, bottom: 0.0, trailing: 44.0))
    }

    private var listView: some View {
        List {
            ForEach(viewModel.contributions, id: \.username) { viewModel in
                ContributionsRow(viewModel: viewModel)
            }
            .onDelete(perform: onDelete)
            .onMove(perform: onMove)
        }
        .listStyle(PlainListStyle())
    }

    private var addContributionsAlert: TextAlert {
        TextAlert(
            title: NSLocalizedString("contributions-add-title", comment: ""),
            placeholder: NSLocalizedString("contributions-add-placeholder", comment: ""),
            accept: NSLocalizedString("contributions-add-accept", comment: ""),
            cancel: NSLocalizedString("contributions-add-cancel", comment: ""),
            action: onAdd
        )
    }

    private func onAdd(username: String?) {
        guard let username = username else { return }
        viewModel.addContributions(from: username)
    }

    private func onDelete(offsets: IndexSet) {
        viewModel.removeContributions(atOffsets: offsets)
    }

    private func onMove(source: IndexSet, destination: Int) {
        viewModel.moveContributions(fromOffsets: source, to: destination)
    }

}
