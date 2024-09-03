//
//  Constants+Strings+Shared.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

extension Constants.Strings {
    enum Shared {
        // !! - Note that all constants use the custom .localized() function which will
        //      allow them to be translated in the future, if necessary.
        //      Any time a constant is added, it will need to be added to the Localizable.strings file
        //      for this to work.
        static let ok = "OK".localized()
        static let uhoh = "Uh oh!".localized()
        static let errorOccurred = "An error occurred.".localized()
        static let reasonColon = "Reason:".localized()
    }
}
