//
//  TemplateCoordinator.swift
//  CodingBase
//
//  Created by Yangsheng Zou on 2020-02-01.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import UIKit

class TemplateNavigationCoordinator: NSObject, NavigationCooordinator {
    var root: UINavigationController
    
    func start() {
        
    }
    
    
    var childCoordinators:[Coordinator] = []
    var parentCoordinator:Coordinator? = nil
    
    init(root: UINavigationController) {
        self.root = root
    }
}
