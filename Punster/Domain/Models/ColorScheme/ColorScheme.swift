//
//  ColorScheme.swift
//  Punster
//
//  Created by Eric Ziegler on 9/3/24.
//

import SwiftUI

enum ColorScheme: Int, CaseIterable {
    case pineGreen
    case crayola
    case goldenrod
    case crimson
    case dodgerBlue
    case princeton
    case indigo
    
    var background: Color {
        switch self {
        case .pineGreen:
            return Color(hex: "#136F63")
        case .crayola:
            return Color(hex: "#EF476F")
        case .goldenrod:
            return Color(hex: "#FAA613")
        case .crimson:
            return Color(hex: "#D7263D")
        case .dodgerBlue:
            return Color(hex: "#0197F6")
        case .princeton:
            return Color(hex: "#FF9505")
        case .indigo:
            return Color(hex: "#4F1271")
        }
    }
    
    var foreground: Color {
        switch self {
        case .pineGreen, .crimson, .indigo:
            return .white
        default:
            return .black
        }
    }
}
