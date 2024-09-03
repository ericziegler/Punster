//
//  AlertInfo.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

// !! - This is a convenience struct that we set up as @Published in view models.
//      See FeedViewModel.handleError and FeedView to see its intended use.
struct AlertInfo {
    var title: String = ""
    var message: String = ""
    var okButton: String = Constants.Strings.Shared.ok
}
