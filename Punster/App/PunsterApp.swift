//
//  PunsterApp.swift
//  Punster
//
//  Created by Eric Ziegler on 9/1/24.
//

import SwiftUI

// !! - This is the entry point to the app, similar to AppDelegate
@main
struct PunsterApp: App {
    
    // !! - AppState holds the state of properties that need to be maintained across the entire app.
    //      It can be passed into a view "stack" by passing it using .environmentObject.
    //      AppState should be used minimally, as we don't want 1000 global variables accessible all over the place.
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            // !! - We control what is displayed by appState.isUserLoggedIn. As soon as isUserLoggedIn is set to true,
            //      this will automatically switch from LoginView to MainTabView.
            if appState.isUserLoggedIn {
                MainTabView()
            } else {
                LoginView()
                    .environmentObject(appState)
            }
        }
    }
}
