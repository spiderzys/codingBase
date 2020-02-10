//
//  UILabelExtensions.swift
//  SpruceMeadowsiOS
//
//  Created by Matthew Musoke on 2018-05-10.
//  Copyright © 2018 IBM. All rights reserved.
//
import UIKit

extension UILabel {
    func setAttributedText(text: String?) {
        guard let text = text else { return }

        let mutableAttributedText = self.attributedText?.mutableCopy() as? NSMutableAttributedString
        mutableAttributedText?.mutableString.setString(text)

        attributedText = mutableAttributedText
    }
}

extension UILabel {
    @IBInspectable
    var letterSpacing: CGFloat {
        set {
            let attributedString: NSMutableAttributedString
            if let currentAttrString = attributedText {
                attributedString = NSMutableAttributedString(attributedString: currentAttrString)
            } else {
                attributedString = NSMutableAttributedString(string: text ?? "")
                text = nil
            }
            attributedString.addAttribute(NSAttributedString.Key.kern, value: newValue, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        } get {
            if let currentLetterSpacing = attributedText?.attribute(NSAttributedString.Key.kern, at: 0, effectiveRange: .none) as? CGFloat {
                return currentLetterSpacing
            } else {
                return 0
            }
        }
    }
}
