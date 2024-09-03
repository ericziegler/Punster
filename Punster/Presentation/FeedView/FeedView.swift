//
//  FeedView.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import SwiftUI

struct FeedView: View {
    
    @StateObject private var viewModel = FeedViewModel()
    
    var body: some View {
        PageBackground {
            Text("Feed")
        }
    }
}

#Preview {
    FeedView()
}
