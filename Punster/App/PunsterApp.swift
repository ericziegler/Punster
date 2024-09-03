//
//  PunsterApp.swift
//  Punster
//
//  Created by Eric Ziegler on 9/1/24.
//

import SwiftUI

@main
struct PunsterApp: App {
    
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            if appState.isUserLoggedIn {
                MainTabView()
            } else {
                LoginView()
                    .environmentObject(appState)
            }
        }
    }
}
