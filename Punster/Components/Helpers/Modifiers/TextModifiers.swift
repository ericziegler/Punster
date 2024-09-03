//
//  TextModifiers.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import SwiftUI

// !! - This is how you create view modifiers (aka things you can add at the end of a view/component.
//      They come in two parts:
//      1. The struct as a ViewModifier which defines the look/behavior you want to modify.
//      2. A view extension with a convenience function that calls the view modifier.
//
//      This file actually has three different modifiers defined (and three convenience View funcs)
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

