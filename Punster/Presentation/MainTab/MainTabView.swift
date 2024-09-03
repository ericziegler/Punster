//
//  MainTabView.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import SwiftUI

struct MainTabView: View {
    
    // !! - Let's talk about the difference between all of these different @'s
    //      First, we need to understand that SwiftUI Views are structs that get
    //      recreated ALL the time. This makes their lifespan short-lived and also
    //      makes them super-lightweight.
    //
    //      Here are the general rules:
    //      1. Only classes can be declared as ObservableObjects. (structs cannot)
    //      2. A class can be observed by either @StateObject or @ObservedObject
    //      3. @StateObject's state/properties are maintained. @ObservedObject is
    //          destroyed and recreated every time the lightweight View is redrawn.
    //      4. Lighter properties that are specific to the state of the view (like
    //          selectedTab here) are declared as @State. These properties are
    //          maintained (just like @StateObject) through the View being destroyed
    //          and recreated.
    @StateObject private var viewModel = MainTabViewModel()
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Group {
                renderTab(view: HomeView(), tab: .home)
                renderTab(view: FeedView(feedViewType: .feed), tab: .feed)
                renderTab(view: FeedView(feedViewType: .favorite), tab: .favorites)
                renderTab(view: SettingsView(), tab: .settings)
            }
            .toolbarBackground(Color.appBackgroundTertiary, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
        .tint(Color.appGreen)
    }
    
    // !! - @ViewBuilder should be used generously when writing Views. Think of it as a function that
    //      renders part of the view. This helps keep the readability/length of the general body down.
    //      A common practice is to start @ViewBuilder functions with `render`, as seen here.
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
