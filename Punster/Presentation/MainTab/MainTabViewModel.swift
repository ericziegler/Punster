//
//  MainTabViewModel.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

final class MainTabViewModel: ObservableObject {
    
    enum Tab: Int {
        case home
        case feed
        case favorites
        case settings
        
        var text: String {
            switch self {
            case .home:
                return Constants.Strings.Home.home
            case .feed:
                return Constants.Strings.Feed.feed
            case .favorites:
                return Constants.Strings.Favorites.favorites
            case .settings:
                return Constants.Strings.Settings.settings
            }
        }
        
        var imageName: String {
            switch self {
            case .home:
                return "house.fill"
            case .feed:
                return "newspaper.fill"
            case .favorites:
                return "heart.fill"
            case .settings:
                return "gearshape.fill"
            }
        }
    }
    
}
