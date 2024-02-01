//
//  Appearance.swift
//  SwiftUI SceneView
//
//  Created by Kyle Lei on 2024/1/27.
//

import Foundation
import SwiftUI

enum Appearance: String, Identifiable, CaseIterable {
    case light = "Light"
    case dark = "Dark"
    
    var scheme: ColorScheme? {
        switch self {
        case .light:
            return ColorScheme.light
        case .dark:
            return ColorScheme.dark

        }
    }
    
    var background: UIColor {
        switch self {
        case .light:
            return  UIColor.white
        case .dark:
            return  UIColor.black

        }
    }

    
    var id: String {
        self.rawValue
    }
}
