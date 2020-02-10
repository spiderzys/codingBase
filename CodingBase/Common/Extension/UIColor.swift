//
//  UIColor.swift
//  CNBMobile
//
//  Created by Steven Dai on 2019-03-05.
//  Copyright © 2019 IBM Corporation. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    
    convenience init(rgbaWithRed red: UInt, green: UInt, blue: UInt, alpha: CGFloat) {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: alpha)
    }

    convenience init(rgbaWithWhite white: UInt, alpha: CGFloat) {
        self.init(white: CGFloat(white) / 255, alpha: alpha)
    }

}
