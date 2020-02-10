


import UIKit

protocol Coordinator:class {
    func start()
    var childCoordinators:[Coordinator] {get set}
    var parentCoordinator:Coordinator? {get set}
    
}

protocol NavigationCooordinator:Coordinator, UINavigationControllerDelegate {
    var root: UINavigationController {get set}
}

protocol tabCoordinator: Coordinator, UITabBarControllerDelegate {
    var tab: UITabBarController {get set}
}

protocol ChildCoordinator: Coordinator {
    var parent: Coordinator? {get set}
}
