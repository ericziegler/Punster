//
//  AppTextStyle.swift
//  Punster
//
//  Created by Eric Ziegler on 9/3/24.
//

import SwiftUI

enum AppTextStyle {
    case largeTitle
    case title
    case body
    case caption
    
    var font: Font {
        switch self {
        case .largeTitle:
            return .appBold(size: 22)
        case .title:
            return .appBold(size: 20)
        case .body:
            return .appRegular(size: 18)
        case .caption:
            return .appRegular(size: 16)
        }
    }
}
