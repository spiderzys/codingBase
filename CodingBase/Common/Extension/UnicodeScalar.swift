//
//  File.swift
//  CodingBase
//
//  Created by Yangsheng Zou on 2020-02-10.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Foundation

extension UnicodeScalar {
    /// Note: This method is part of Swift 5, so you can omit this.
    /// See: https://developer.apple.com/documentation/swift/unicode/scalar
    var isEmoji: Bool {
        switch value {
        case 0x1F600...0x1F64F, // Emoticons
        0x1F300...0x1F5FF, // Misc Symbols and Pictographs
        0x1F680...0x1F6FF, // Transport and Map
        0x1F1E6...0x1F1FF, // Regional country flags
        0x2600...0x26FF, // Misc symbols
        0x2700...0x27BF, // Dingbats
        0xE0020...0xE007F, // Tags
        0xFE00...0xFE0F, // Variation Selectors
        0x1F900...0x1F9FF, // Supplemental Symbols and Pictographs
        0x1F018...0x1F270, // Various asian characters
        0x238C...0x2454, // Misc items
        0x20D0...0x20FF: // Combining Diacritical Marks for Symbols
            return true
            
        default: return false
        }
    }
    
    var isZeroWidthJoiner: Bool {
        return value == 8205
    }
}
