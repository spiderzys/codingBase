//
//  UIViewExtensions.swift
//  SpruceMeadowsiOS
//
//  Created by Kevin Dion on 2018-04-11.
//  Copyright © 2018 IBM. All rights reserved.
//

import UIKit



extension UIView {
    func fadeIn(duration: Double, completion: @escaping (Bool) -> Void) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        }, completion: completion)
    }

    func fadeOut(duration: Double, completion: @escaping (Bool) -> Void) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        }, completion: completion)
    }

    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")

        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards

        self.layer.add(animation, forKey: nil)
    }
}

extension UIView {
    func addSubviewConstrainedToBounds(_ view: UIView) {
        self.addSubview(view)
        view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}

@IBDesignable extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        } get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        } get {
            return layer.borderWidth
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        } get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
