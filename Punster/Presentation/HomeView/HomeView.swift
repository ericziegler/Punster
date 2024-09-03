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
            PageBackground {
                Text(Constants.Strings.Home.home)
            }
            .appNavBar(title: Constants.Strings.Home.home)
        }
    }
}

#Preview {
    HomeView()
}
