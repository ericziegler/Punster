//
//  JokeView.swift
//  Punster
//
//  Created by Eric Ziegler on 9/3/24.
//

import SwiftUI

struct JokeView: View {
    
    var text: String
    var colorScheme: ColorScheme
    
    var body: some View {
        PageBackground(overrideColor: colorScheme.background) {
            AppLabel(text: text,
                     style: .title,
                     color: colorScheme.foreground)
            .padding(30)
        }
    }
}

#Preview {
    VStack {
        JokeView(text: Joke.mockData().text,
                 colorScheme: .pineGreen)
    }
    .frame(width: 300, height: 300)
}
