//
//  ContributionsWidgetBundle.swift
//  ContributionsWidget
//
//  Created by Ander Goig on 14/10/2020.
//

import SwiftUI
import WidgetKit

@main
struct ContributionsWidgetBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        ContributionsGraphWidget()
    }
}
