//
//  ColorScheme.swift
//  Punster
//
//  Created by Eric Ziegler on 9/3/24.
//

import SwiftUI

// !! - This is just to color the various joke views. Isn't fetched, doesn't need cached.
enum ColorScheme: Int, CaseIterable {
    case pineGreen
    case crayola
    case goldenrod
    case crimson
    case dodgerBlue
    case indigo
    case charcoal
    
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
        case .indigo:
            return Color(hex: "#4F1271")
        case .charcoal:
            return Color(hex: "#333333")
        }
    }
    
    var foreground: Color {
        switch self {
        case .pineGreen, .crimson, .indigo, .charcoal:
            return .white
        default:
            return .black
        }
    }
}
