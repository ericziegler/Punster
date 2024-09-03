//
//  PageBackground.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import SwiftUI

struct PageBackground<Content: View>: View {

    var overlay: (() -> AnyView?)?
    var overrideColor: Color?
    var color: Color {
        overrideColor ?? Color.appBackground
    }
    // !! - This is a common way to allow a parent view to embed content within a child view.
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        ZStack {
            color
                .edgesIgnoringSafeArea(.all)
            HStack(content: content)
            if let overlay = overlay?() {
                overlay
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

#Preview {
    PageBackground {
        Text("Hello!")
    }
}
