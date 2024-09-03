//
//  String+Extensions.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import Foundation

extension String {
    func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
}
