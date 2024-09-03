//
//  NavBarModifier.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import SwiftUI

struct AppNavBarModifier<Leading, Trailing>: ViewModifier where Leading: View, Trailing: View {
    var title: String
    var font: Font = Font.appBold(size: 22)
    var offsetY: Double = 0
    var leadingView: Leading?
    var trailingView: Trailing?
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                // Leading
                if let leading = leadingView {
                    ToolbarItem(placement: .navigationBarLeading) {
                        leading
                    }
                }
                
                // Title
                ToolbarItem(placement: .principal) {
                    VStack {
                        AppLabel(text: title.uppercased(),
                                 style: .largeTitle)
                        .offset(y: offsetY)
                    }
                }
                
                // Trailing
                if let trailing = trailingView {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        trailing
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.appBackgroundTertiary, for: .navigationBar)
    }
}

extension View {
    func appNavBar(title: String,
                   font: Font = .appBold(size: 22),
                   offsetY: Double = 0,
                   leading: some View = EmptyView(),
                   trailing: some View = EmptyView()) -> some View {
        self.modifier(AppNavBarModifier(title: title, font: font, offsetY: offsetY, leadingView: leading, trailingView: trailing))
    }
}
