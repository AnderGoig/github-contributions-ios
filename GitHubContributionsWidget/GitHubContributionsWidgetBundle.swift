//
//  GitHubContributionsWidgetBundle.swift
//  GitHubContributionsWidget
//
//  Created by Ander Goig on 14/10/2020.
//

import SwiftUI
import WidgetKit

@main
struct GitHubContributionsWidgetBundle: WidgetBundle {

    @WidgetBundleBuilder
    var body: some Widget {
        GitHubContributionsGraphWidget()
    }

}
