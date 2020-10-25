//
//  GuideView.swift
//  GitHubContributions
//
//  Created by Ander Goig on 22/10/2020.
//

import SwiftUI

struct GuideView: View {

    var body: some View {
        TabView {
            ForEach(Step.allCases) { step in
                StepView(step: step)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .tabViewStyle(PageTabViewStyle())
        .navigationTitle(LocalizedStringKey("widget-guide-title"))
    }

}
