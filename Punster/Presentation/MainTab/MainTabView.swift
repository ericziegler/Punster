//
//  MainTabView.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject private var viewModel = MainTabViewModel()
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Group {
                renderTab(view: HomeView(), tab: .home)
                renderTab(view: FeedView(), tab: .feed)
                renderTab(view: FavoritesView(), tab: .favorites)
                renderTab(view: SettingsView(), tab: .settings)
            }
            .toolbarBackground(Color.appBackground, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
        .tint(Color.appGreen)
    }
    
    @ViewBuilder private func renderTab(view: some View, tab: MainTabViewModel.Tab) -> some View {
        view
            .tag(tab.rawValue)
            .tabItem {
                Image(systemName: tab.imageName)
                Text(tab.text)
            }
    }
    
}

#Preview {
    MainTabView()
}
