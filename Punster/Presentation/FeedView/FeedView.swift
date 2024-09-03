//
//  FeedView.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import SwiftUI

struct FeedView: View {
    
    @StateObject private var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            PageBackground {
                List(viewModel.feedJokes.indices, id: \.self) { index in
                    JokeContainer(
                        joke: viewModel.feedJokes[index].joke,
                        colorScheme: viewModel.feedJokes[index].colorScheme,
                        onFavoriteTapped: {
                            viewModel.toggleFavoriteJoke(at: index)
                        },
                        isFavorite: $viewModel.feedJokes[index].isFavorite
                    )
                    .listRowBackground(Color.clear)
                }
                .listRowSpacing(20)
                .listStyle(.plain)
                .padding(.vertical, 20)
            }
            .appNavBar(title: Constants.Strings.Feed.feed)
        }
        .onAppear(perform: {
            Task {
                await viewModel.loadData()
            }
        })
        .alert(viewModel.alertInfo.title,
               isPresented: $viewModel.isAlertVisible,
               actions: {
            Button(viewModel.alertInfo.okButton) {
                viewModel.isAlertVisible.toggle()
            }
        }, message: {
            Text(viewModel.alertInfo.message)
        })
    }
}

#Preview {
    FeedView()
}
