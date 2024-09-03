//
//  TextModifiers.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import SwiftUI

struct AppRegularFontModifier: ViewModifier {
    var size: Double

    func body(content: Content) -> some View {
        content
            .font(.appRegular(size: size))
    }
}

struct AppLightFontModifier: ViewModifier {
    var size: Double

    func body(content: Content) -> some View {
        content
            .font(.appLight(size: size))
    }
}

struct AppBoldFontModifier: ViewModifier {
    var size: Double

    func body(content: Content) -> some View {
        content
            .font(.appBold(size: size))
    }
}

extension View {    
    func appRegularFont(size: Double) -> some View {
        self.modifier(AppRegularFontModifier(size: size))
    }
    
    func appLightFont(size: Double) -> some View {
        self.modifier(AppLightFontModifier(size: size))
    }
    
    func appBoldFont(size: Double) -> some View {
        self.modifier(AppBoldFontModifier(size: size))
    }
}

