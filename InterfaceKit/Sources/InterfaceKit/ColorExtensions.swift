//
//  ColorExtensions.swift
//  InterfaceKit
//
//  Created by Ander Goig on 21/10/2020.
//

import SwiftUI

// MARK: - Properties

public extension Color {

    static var widgetBackground: Color {
        Color(.init { trait in
            trait.userInterfaceStyle == .dark
                ? UIColor.systemGray6
                : UIColor.white
        })
    }

    static var tileBorder: Color {
        Color(.init { trait in
            trait.userInterfaceStyle == .dark
                ? UIColor(red: 0.329, green: 0.329, blue: 0.345, alpha: 0.2)
                : UIColor(red: 0.106, green: 0.122, blue: 0.137, alpha: 0.04)
        })
    }

    static var emptyTile: Color {
        Color(.init { trait in
            trait.userInterfaceStyle == .dark
                ? UIColor.quaternarySystemFill
                : UIColor(red: 0.922, green: 0.929, blue: 0.941, alpha: 1.0)
        })
    }

    // MARK: - Blue Theme

    static var blueLevel1: Color {
        Color(.sRGB, red: 0.475, green: 0.722, blue: 1.0, opacity: 1.0)
    }

    static var blueLevel2: Color {
        Color(.sRGB, red: 0.129, green: 0.533, blue: 1.0, opacity: 1.0)
    }

    static var blueLevel3: Color {
        Color(.sRGB, red: 0.0, green: 0.361, blue: 0.773, opacity: 1.0)
    }

    static var blueLevel4: Color {
        Color(.sRGB, red: 0.016, green: 0.259, blue: 0.537, opacity: 1.0)
    }

    // MARK: - Green Theme

    static var greenLevel1: Color {
        Color(.sRGB, red: 0.608, green: 0.914, blue: 0.659, opacity: 1.0)
    }

    static var greenLevel2: Color {
        Color(.sRGB, red: 0.251, green: 0.769, blue: 0.388, opacity: 1.0)
    }

    static var greenLevel3: Color {
        Color(.sRGB, red: 0.188, green: 0.631, blue: 0.306, opacity: 1.0)
    }

    static var greenLevel4: Color {
        Color(.sRGB, red: 0.129, green: 0.431, blue: 0.224, opacity: 1.0)
    }

    // MARK: - Red Theme

    static var redLevel1: Color {
        Color(.sRGB, red: 0.976, green: 0.459, blue: 0.514, opacity: 1.0)
    }

    static var redLevel2: Color {
        Color(.sRGB, red: 0.918, green: 0.290, blue: 0.353, opacity: 1.0)
    }

    static var redLevel3: Color {
        Color(.sRGB, red: 0.796, green: 0.141, blue: 0.192, opacity: 1.0)
    }

    static var redLevel4: Color {
        Color(.sRGB, red: 0.702, green: 0.114, blue: 0.157, opacity: 1.0)
    }

}
