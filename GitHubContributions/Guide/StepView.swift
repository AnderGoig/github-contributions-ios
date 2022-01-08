//
//  StepView.swift
//  GitHubContributions
//
//  Created by Ander Goig on 24/10/2020.
//

import SwiftUI
import Kingfisher

struct StepView: View {

    @Environment (\.colorScheme) var colorScheme: ColorScheme
    let step: Step

    var body: some View {
        VStack(spacing: 32.0) {
            VStack(spacing: 6.0) {
                Text(step.title)
                    .font(.title.bold())
                    .foregroundColor(.primary)

                Text(step.subtitle)
                    .font(.callout)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            }

            KFImage(colorScheme == .dark ? step.darkImage : step.lightImage)
                .backgroundDecode()
                .placeholder {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                .resizable()
                .scaledToFit()
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.horizontal, 24.0)
        .padding(.bottom, 64.0)
        .padding(.top, 32.0)
    }

}
