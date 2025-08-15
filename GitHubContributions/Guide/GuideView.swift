//
//  GuideView.swift
//  GitHubContributions
//
//  Created by Ander Goig on 22/10/2020.
//

import SwiftUI

struct GuideView: View {
    // MARK: - View

    var body: some View {
        TabView {
            ForEach(Step.allCases, id: \.rawValue) { step in
                StepView(step: step)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .navigationTitle("widget-guide-title")
        .navigationBarTitleDisplayMode(.inline)
    }
}
