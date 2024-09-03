//
//  LoginView.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import SwiftUI

struct LoginView: View {
    // !! - This was injected from AppState via the .environmentObject modifier.
    //      It can be accessed using @EnvironmentObject, and is essentially treated
    //      as an observed @StateObject (more on this later).
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        // !! - Coloring backgrounds in SwiftUI is a bit tricky, so we have this
        //      `PageBackground` convenience view that allows you to embed your
        //      content. It has a default color that can be overriddent like this:
        //      PageBackground(overrideColor: Color.red) {
        PageBackground {
            VStack {
                Text(Constants.Strings.Login.loginMessage)
                    .appRegularFont(size: 24)
                    .padding(.bottom, 20)
                    .multilineTextAlignment(.center)
                AppButton(text: Constants.Strings.Login.login.uppercased()) {
                    appState.login()
                }
            }
            .padding()
        }
    }
}

#Preview {
    // !! - Note that whenever a view uses @EnvironmentObject, its Preview will
    //      need to have the object injected. Otherwise, the Preview will either
    //      crash or not render.
    LoginView()
        .environmentObject(AppState())
}
