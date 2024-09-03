//
//  JokeContainer.swift
//  Punster
//
//  Created by Eric Ziegler on 9/3/24.
//

import SwiftUI

// !! - JokeContainer contains a PagedJokeView contains a JokeView
struct JokeContainer: View {
    
    var joke: Joke
    var colorScheme: ColorScheme
    // !! - This is a commone way to pass back up from a child to a parent.
    //      We should avoid delegation as it makes the light views cumbersome.
    var onFavoriteTapped: (() -> Void)?
    
    // !! - Similar to @State, changing the value of this property will force the
    //      view to redraw itself. The reason this is a binding and not @State is
    //      because a parent view holds the actual @State version of it
    @Binding var isFavorite: Bool
    
    var body: some View {
        PageBackground(overrideColor: .appBackgroundTertiary) {
            VStack {
                renderFavoriteBar()
                PagedJokeView(joke: joke, colorScheme: colorScheme)
                    .frame(minHeight: 200, maxHeight: 350)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
    }
    
    @ViewBuilder private func renderFavoriteBar() -> some View {
        HStack {
            Spacer()
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .frame(width: 30, height: 30)
                .onTapGesture {
                    // !! - This is the callback to the parent to let it know that
                    //      the favorite button was tapped. The parent that owns the
                    //      @State version of the isFavorite @Binding will handle updating.
                    onFavoriteTapped?()
                }
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    // !! - Note that when we have to pass in bindings, we can use .constant()
    //      There is a more dynamic way to do this so that the #Preview updates,
    //      but I don't remember off the top of my head =)
    JokeContainer(joke: Joke.mockData(isSingle: false),
                  colorScheme: .crimson,
                  isFavorite: .constant(false))
    .frame(width: 300, height: 300)
}
