//
//  GitHubContributionsWidgetBundle.swift
//  GitHubContributionsWidget
//
//  Created by Ander Goig on 14/10/2020.
//

import WidgetKit
import SwiftUI

@main
struct GitHubContributionsWidgetBundle: WidgetBundle {

    @WidgetBundleBuilder
    var body: some Widget {
        GitHubContributionsGraphWidget()
    }

}
