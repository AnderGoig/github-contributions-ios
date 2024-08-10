//
//  ContributionsList.swift
//  GitHubContributions
//
//  Created by Ander Goig on 06/02/2021.
//

import InterfaceKit
import SwiftUI

struct ContributionsList: View {
    // MARK: - Properties

    @State private var username = ""
    @State private var showsAlert = false
    @ObservedObject var viewModel: ContributionsListViewModel

    // MARK: - View

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.contributions, id: \.username) { viewModel in
                    ContributionsRow(viewModel: viewModel)
                }
                .onDelete(perform: onDelete)
                .onMove(perform: onMove)
                .listRowSeparator(.hidden)
            }
            .overlay {
                if viewModel.contributions.isEmpty {
                    emptyView
                }
            }
            .animation(.default, value: viewModel.contributions.count)
            .background(Color(uiColor: .systemGroupedBackground))
            .ignoresSafeArea(.keyboard)
            .navigationTitle("app-title")
            .toolbar {
                Button(action: { showsAlert = true }) {
                    Image(systemName: "plus.circle.fill")
                }
            }
        }
        .alert("contributions-add-title", isPresented: $showsAlert) {
            TextField("contributions-add-placeholder", text: $username).textInputAutocapitalization(.never).autocorrectionDisabled()
            Button("contributions-add-accept", action: onAddUsername)
            Button("contributions-add-cancel", role: .cancel, action: resetUsername)
        }
    }

    private var emptyView: some View {
        VStack(spacing: 6) {
            Text("contributions-empty-title")
                .font(.headline)
                .foregroundColor(.primary)

            Text("contributions-empty-subtitle")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .multilineTextAlignment(.center)
        .padding(.horizontal, 44)
        .transition(.scale(scale: 0.8).combined(with: .opacity).animation(.snappy.speed(2)))
    }

    // MARK: - Private Methods

    private func onAddUsername() {
        viewModel.addContributions(from: username)
        resetUsername()
    }

    private func resetUsername() {
        username = ""
    }

    private func onDelete(offsets: IndexSet) {
        viewModel.removeContributions(atOffsets: offsets)
    }

    private func onMove(source: IndexSet, destination: Int) {
        viewModel.moveContributions(fromOffsets: source, to: destination)
    }
}
