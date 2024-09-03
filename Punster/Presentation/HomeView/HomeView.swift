//
//  HomeView.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import SwiftUI

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
        .onAppear(perform: {
            // !! - For all intents and purposes, .onAppear behaves like a
            //      view controller's viewDidLoad().
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
