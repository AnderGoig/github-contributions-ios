//
//  StepView.swift
//  GitHubContributions
//
//  Created by Ander Goig on 24/10/2020.
//

import SwiftUI

struct StepView: View {

    let step: Step

    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 6.0) {
                Text(step.title)
                    .font(.system(size: 28.0, weight: .bold, design: .default))
                    .foregroundColor(.primary)

                Text(step.subtitle)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }

            Image(step.image)
                .resizable()
                .scaledToFit()
                .offset(y: 60.0)
                .scaleEffect(1.5)
        }
        .padding(.top, 40.0)
        .padding(.horizontal)
    }

}
