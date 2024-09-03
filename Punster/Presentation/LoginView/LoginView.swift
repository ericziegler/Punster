//
//  LoginView.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
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
    LoginView()
}
