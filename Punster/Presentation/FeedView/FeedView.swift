//
//  FeedView.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import SwiftUI

// !! - FeedView/ViewModel cover both the Feed tab and the Favorites tab based on FeedViewType
struct FeedView: View {
        
    @StateObject private var viewModel: FeedViewModel
    
    init(feedViewType: FeedViewType) {
        // !! - This is the syntax for setting a StateObject in the init of a View:
        //      underscore<variableName> = StateObject(wrappedValue: <object you want to set it to>)
        _viewModel = StateObject(wrappedValue: FeedViewModel(feedViewType: feedViewType))
    }
    
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
            .appNavBar(title: viewModel.feedViewType == .feed ? Constants.Strings.Feed.feed : Constants.Strings.Favorites.favorites)
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
    FeedView(feedViewType: .feed)
}
