//
//  FavoritesView.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import SwiftUI

struct FavoritesView: View {
    
    @StateObject private var viewModel = FavoritesViewModel()
    
    var body: some View {
        NavigationStack {
            PageBackground {
                Text(Constants.Strings.Favorites.favorites)
            }
            .appNavBar(title: Constants.Strings.Favorites.favorites)
        }
    }
}

#Preview {
    FavoritesView()
}
