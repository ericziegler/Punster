//
//  AppLabel.swift
//  Punster
//
//  Created by Eric Ziegler on 9/3/24.
//

import SwiftUI

struct AppLabel: View {
    var text: String
    var style: AppTextStyle
    var color: Color = Color.appText
    
    var body: some View {
        Text(text)
            .font(style.font)
            .foregroundStyle(color)
    }
}

#Preview {
    AppLabel(text: "This is a label",
             style: .title)
}
