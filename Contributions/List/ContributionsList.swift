//
//  ContributionsList.swift
//  Contributions
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

    private let columns = [
        GridItem(.adaptive(minimum: 300), spacing: 16)
    ]

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
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.contributions, id: \.username) { contribution in
                    ContributionsRow(viewModel: contribution)
                        .padding(.horizontal, 16)
                        .background(Color.backgroundSecondary, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                        .contextMenu {
                            Button(role: .destructive, action: { onDelete(contribution) }) {
                                Label("contributions-delete", systemImage: "trash")
                            }
                        }
                }
            }
            .padding(16)
        }
        .overlay {
            if viewModel.contributions.isEmpty {
                emptyView.transition(.scale(scale: 0.8).combined(with: .opacity).animation(.snappy.speed(2)))
            }
        }
        .task(viewModel.loadContributions)
        .animation(.default, value: viewModel.contributions.count)
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

    private func onDelete(_ contribution: ContributionsRowViewModel) {
        Task {
            await viewModel.removeContributions(contribution)
        }
    }

    private func resetUsername() {
        username = ""
    }
}
