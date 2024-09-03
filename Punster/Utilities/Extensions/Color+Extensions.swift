//
//  Color+Extensions.swift
//  Punster
//
//  Created by Eric Ziegler on 9/3/24.
//

import SwiftUI

extension Color {
    init(hex: String) {
        // Remove any leading "#" character if present
        var cleanedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if cleanedHex.hasPrefix("#") {
            cleanedHex = String(cleanedHex.dropFirst())
        }

        // Ensure the cleanedHex has 6 characters
        guard cleanedHex.count == 6 else {
            self.init(.clear)
            return
        }

        // Parse the hex values for red, green, and blue
        var rgb: UInt64 = 0
        Scanner(string: cleanedHex).scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}
