//
//  StepView.swift
//  GitHubContributions
//
//  Created by Ander Goig on 24/10/2020.
//

import Kingfisher
import SwiftUI

struct StepView: View {
    // MARK: - Properties

    @Environment(\.colorScheme) var colorScheme: ColorScheme
    let step: Step

    // MARK: - View

    var body: some View {
        VStack(spacing: 32) {
            VStack(spacing: 6) {
                Text(step.title)
                    .font(.title.bold())
                    .foregroundColor(.primary)

                Text(step.subtitle)
                    .font(.callout)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            }

            KFImage(colorScheme == .dark ? step.darkImageURL : step.lightImageURL)
                .backgroundDecode()
                .placeholder {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                .resizable()
                .scaledToFit()
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.horizontal, 24)
        .padding(.bottom, 64)
        .padding(.top, 32)
    }
}
