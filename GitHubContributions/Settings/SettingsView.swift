//
//  SettingsView.swift
//  GitHubContributions
//
//  Created by Ander Goig on 14/10/2020.
//

import SwiftUI
import InterfaceKit

struct SettingsView: View {

    @ObservedObject var viewModel: SettingsViewModel

    // MARK: -

    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(viewModel.topItems, id: \.rawValue) { item in
                        NavigationLink(destination: GuideView()) {
                            SettingsRow(item: item)
                        }
                    }
                }

                Section(footer: footer) {
                    ForEach(viewModel.footerItems, id: \.rawValue) { item in
                        Button(action: { handleTapOnItem(item) }) {
                            SettingsRow(item: item)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("settings-title")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    var footer: some View {
        GitHubContributionsApp.fullVersion
            .map { Text("app-version-\($0)") }
            .textCase(.uppercase)
            .foregroundColor(.secondary)
            .font(.caption2)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, alignment: .center)
            .listRowInsets(EdgeInsets(top: 24.0, leading: 0.0, bottom: 24.0, trailing: 0.0))
    }

    // MARK: -

    private func handleTapOnItem(_ item: SettingsItem) {
        switch item {
        case .widgetGuide:
            break
        case .rate:
            openURL(viewModel.rateURL)
        case .share:
            present(UIActivityViewController(activityItems: [viewModel.shareURL], applicationActivities: nil), animated: true)
        case .feedback:
            openURL(viewModel.feedbackURL)
        case .openSource:
            openURL(viewModel.openSourceURL)
        }
    }

    private func openURL(_ url: URL) {
        UIApplication.shared.open(url)
    }

    private func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
        guard var topController = UIApplication.shared.keyWindow?.rootViewController else { return }

        while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
        }

        topController.present(viewController, animated: animated, completion: completion)
    }

}

// MARK: -

private extension UIApplication {

    var keyWindow: UIWindow? {
        UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first { $0 is UIWindowScene }
            .flatMap { $0 as? UIWindowScene }?.windows
            .first(where: \.isKeyWindow)
    }

}
