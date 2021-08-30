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

    static let blueLevel1 = Color("BlueLevel1", bundle: .module)
    static let blueLevel2 = Color("BlueLevel2", bundle: .module)
    static let blueLevel3 = Color("BlueLevel3", bundle: .module)
    static let blueLevel4 = Color("BlueLevel4", bundle: .module)

    // MARK: - Green Theme

    static let greenLevel1 = Color("GreenLevel1", bundle: .module)
    static let greenLevel2 = Color("GreenLevel2", bundle: .module)
    static let greenLevel3 = Color("GreenLevel3", bundle: .module)
    static let greenLevel4 = Color("GreenLevel4", bundle: .module)

    // MARK: - Red Theme

    static let redLevel1 = Color("RedLevel1", bundle: .module)
    static let redLevel2 = Color("RedLevel2", bundle: .module)
    static let redLevel3 = Color("RedLevel3", bundle: .module)
    static let redLevel4 = Color("RedLevel4", bundle: .module)
    
    // MARK: - Purple Theme

    static let purpleLevel1 = Color("PurpleLevel1", bundle: .module)
    static let purpleLevel2 = Color("PurpleLevel2", bundle: .module)
    static let purpleLevel3 = Color("PurpleLevel3", bundle: .module)
    static let purpleLevel4 = Color("PurpleLevel4", bundle: .module)
}
