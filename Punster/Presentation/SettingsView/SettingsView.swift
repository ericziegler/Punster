//
//  SettingsView.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    
    var body: some View {
        PageBackground {
            Text("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
