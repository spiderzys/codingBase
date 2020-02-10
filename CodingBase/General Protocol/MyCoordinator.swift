//
//  Coordinator.swift
//  CodingBase
//
//  Created by Yangsheng Zou on 2020-01-26.
//  Copyright © 2020 Yangsheng. All rights reserved.
//
/*

import UIKit
protocol Coordinator {
    func start()
}

protocol RootBasedCoordinator:Coordinator {
    var root: RootType {get}
    associatedtype RootType
    associatedtype Destination:CoordinatorDestinationProtocol
    func route(to destination: Destination)
    var childCoordinators:[Coordinator] {get set}
    var parentCoordinator: Coordinator? {get set}
    
}


protocol NavigationCoordinator:RootBasedCoordinator {
    var root: UINavigationController  {get}
    
}


protocol TabCoordinator:RootBasedCoordinator {
    var root: UITabBarController  {get}
}

protocol CoordinatorDestinationProtocol {
    func viewController() -> UIViewController
}

class ExampleNavigationCoordinator:NavigationCoordinator {
    
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    let root:UINavigationController
    init(root: UINavigationController) {
        self.root = root
    }
    
    func start() {
      
    }
    
    enum Destination:CoordinatorDestinationProtocol {
        case first
        func viewController() -> UIViewController {
            return UIViewController()
        }
    }
    
    func route(to destination: Destination) {
        
    }
    
    
}
*/
