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

    private var plusSymbolVariant: SymbolVariants {
        if #available(*, iOS 26) { return .none }
        return .circle.fill
    }

    private var plusSymbolFont: Font {
        if #available(*, iOS 26) { return .headline }
        return .title2
    }

    // MARK: - View

    var body: some View {
        List {
            ForEach(viewModel.contributions, id: \.username) { viewModel in
                ContributionsRow(viewModel: viewModel)
            }
            .onDelete(perform: onDelete)
            .onMove(perform: onMove)
            .listRowBackground(Color.backgroundSecondary)
            .listRowSeparatorTint(Color.backgroundSeparator)
            .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
        }
        .overlay {
            if viewModel.contributions.isEmpty {
                emptyView.transition(.scale(scale: 0.8).combined(with: .opacity).animation(.snappy.speed(2)))
            }
        }
        .task(viewModel.loadContributions)
        .animation(.default, value: viewModel.contributions.count)
        .scrollContentBackground(.hidden)
        .background(Color.backgroundPrimary)
        .ignoresSafeArea(.keyboard)
        .navigationTitle("app-title")
        .toolbar {
            Button(action: { showsAlert = true }) {
                Image(systemName: "plus")
                    .symbolVariant(plusSymbolVariant)
                    .font(plusSymbolFont)
            }
        }
        .alert("contributions-add-title", isPresented: $showsAlert, actions: {
            TextField("contributions-add-placeholder", text: $username)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()

            Button("contributions-add-accept", action: onAddUsername)
            Button("contributions-add-cancel", role: .cancel, action: resetUsername)
        }, message: {
            Text("contributions-add-message")
        })
    }

    @ViewBuilder
    private var emptyView: some View {
        if #available(iOS 17.0, *) {
            ContentUnavailableView {
                Label("contributions-empty-title", systemImage: "plus.app.fill")
            } description: {
                Text("contributions-empty-subtitle")
            } actions: {
                Button("contributions-add-accept", action: { showsAlert = true })
                    .buttonStyle(.bordered)
                    .font(.headline)
            }
        } else {
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
        }
    }

    // MARK: - Private Methods

    private func onAddUsername() {
        Task {
            await viewModel.addContributions(from: username)
            resetUsername()
        }
    }

    private func onDelete(offsets: IndexSet) {
        Task {
            await viewModel.removeContributions(atOffsets: offsets)
        }
    }

    private func onMove(source: IndexSet, destination: Int) {
        Task {
            await viewModel.moveContributions(fromOffsets: source, to: destination)
        }
    }

    private func resetUsername() {
        username = ""
    }
}
