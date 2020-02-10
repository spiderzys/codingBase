//
//  ViewController.swift
//  CNBMobile
//
//  Created by Mohamed Baraka on 2019-05-08.
//  Copyright © 2019 IBM Corporation. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    var previousViewController: UIViewController?{
        if let controllersOnNavStack = self.navigationController?.viewControllers, controllersOnNavStack.count >= 2 {
            return controllersOnNavStack[controllersOnNavStack.count - 2]
        }
        return nil
    }
    
    func getTopController() -> UIViewController? {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
    
}
