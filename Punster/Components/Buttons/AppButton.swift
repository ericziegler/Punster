//
//  AppButton.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import SwiftUI

struct AppButton: View {
    
    var text: String
    var overrideTextColor: Color?
    var textColor: Color {
        overrideTextColor ?? .white
    }
    var overrideBGColor: Color?
    var bgColor: Color {
        overrideBGColor ?? .appGreen
    }
    var isDisabled: Bool = false
    var onTap: (() -> Void)?
    
    var body: some View {
        Button(action: {
            if !isDisabled {
                onTap?()
            }
        }, label: {
            Text(text)
                .appBoldFont(size: 26)
                .foregroundStyle(textColor)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
        })
        .buttonStyle(.borderedProminent)
        .tint(bgColor)
        .opacity(isDisabled ? 0.65 : 1)
    }
}

#Preview {
    PageBackground {
        AppButton(text: "Tap Me")
            .padding()
    }
}
