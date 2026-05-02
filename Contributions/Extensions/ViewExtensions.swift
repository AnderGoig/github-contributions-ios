//
//  ViewExtensions.swift
//  Contributions
//
//  Created by Ander Goig on 02/05/2026.
//

import SwiftUI

extension View {
    @available(iOS, obsoleted: 17, message: "Can be removed once we only support iOS 17+")
    @ViewBuilder func inlineLargeToolbarTitle() -> some View {
        if #available(iOS 17, *) {
            self.toolbarTitleDisplayMode(.inlineLarge)
        } else {
            self
        }
    }
}
