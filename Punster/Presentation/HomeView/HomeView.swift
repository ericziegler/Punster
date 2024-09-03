//
//  HomeView.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import SwiftUI

// !! - Remember, a View and ViewModel essentially make up a ViewController. The actual laying out of the view
//      happens in the view, while all of the logic is broken out into the view model. This keeps us from having
//      massive files that maintain both business logic AND UI code.
struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            PageBackground(overrideColor: .appBackgroundTertiary) {
                VStack {
                    renderHeader()
                    if let dailyJoke = viewModel.dailyJoke {
                        JokeContainer(joke: dailyJoke.joke,
                                      colorScheme: dailyJoke.colorScheme,
                                      showBorder: false,
                                      onFavoriteTapped: {
                                          viewModel.toggleFavoriteJoke()
                                      },
                                      isFavorite: viewModel.isFavoriteBinding)
                        .frame(maxHeight: 400)
                    }
                    Spacer()
                }
                .padding(.vertical)
            }
            .appNavBar(title: Constants.Strings.Home.home)
        }
        .task {
            // !! - For all intents and purposes, .task behaves like an
            //      async version of view controller's viewDidAppear().
            //      If you want a regular version that's similar to viewDidAppear,
            //      use the .onAppear(perform: {} block instead.
            await viewModel.loadData()
        }
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
    
    @ViewBuilder private func renderHeader() -> some View {
        HStack {
            AppLabel(text: Constants.Strings.Home.todaysPun,
                     style: .largeTitle)
            Spacer()
            AppLabel(text: viewModel.currentDate,
                     style: .caption)
        }
        .padding(.horizontal)
        .frame(alignment: .leading)
    }
}

#Preview {
    HomeView()
}
