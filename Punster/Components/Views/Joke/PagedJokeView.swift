//
//  PagedJokeView.swift
//  Punster
//
//  Created by Eric Ziegler on 9/3/24.
//

import SwiftUI

struct PagedJokeView: View {
    private var texts: [String]
    private var colorScheme: ColorScheme
    
    @State private var currentIndex: Int = 0
    
    init(joke: Joke, colorScheme: ColorScheme) {
        texts = []
        texts.append(joke.text)
        if let setupText = joke.setupText {
            texts.append(setupText)
        }
        self.colorScheme = colorScheme
    }
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(0..<texts.count, id: \.self) { index in
                JokeView(text: texts[index], colorScheme: colorScheme)
                .tag(index)
                .onTapGesture {
                    toggleIndex()
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
    
    private func toggleIndex() {
        if texts.count > 1 {
            withAnimation {
                currentIndex = currentIndex == 0 ? 1 : 0
            }
        }
    }
}

#Preview {
    PagedJokeView(joke: Joke.mockData(isSingle: false),
                  colorScheme: .crayola)
    .frame(width: 300, height: 300)
}
