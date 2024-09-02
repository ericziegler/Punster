//
//  Font+Extensions.swift
//  Punster
//
//  Created by Eric Ziegler on 9/2/24.
//

import SwiftUI

extension Font {
 
    static func appBold(size: Double) -> Font {
        Font.custom("Inter-Bold", size: size)
    }
    
    static func appLight(size: Double) -> Font {
        Font.custom("Inter-ExtraLight", size: size)
    }
    
    static func appRegular(size: Double) -> Font {
        Font.custom("Inter-Regular", size: size)
    }
    
}
