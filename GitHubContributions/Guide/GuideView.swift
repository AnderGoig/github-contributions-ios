//
//  GuideView.swift
//  GitHubContributions
//
//  Created by Ander Goig on 22/10/2020.
//

import SwiftUI

struct GuideView: View {

    var body: some View {
        ZStack(alignment: .bottom) {
            Color(UIColor.systemGroupedBackground)
                .edgesIgnoringSafeArea(.bottom)

            RoundedRectangle(cornerRadius: 20.0, style: .continuous)
                .fill(Color(UIColor.secondarySystemFill))
                .frame(width: 132.0, height: 24.0, alignment: .bottom)
                .padding(.bottom, 14.0)

            TabView {
                ForEach(Step.allCases) { step in
                    StepView(step: step)
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
        .navigationTitle(LocalizedStringKey("widget-guide-title"))
    }

}
