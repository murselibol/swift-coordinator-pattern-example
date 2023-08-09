//
//  HomeCoordinator.swift
//  coordinator-pattern
//
//  Created by Mursel Elibol on 5.08.2023.
//

import UIKit

class HomeCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        print("Init", Self.self)
        self.navigationController = navigationController
    }
    deinit { print("DeInit", Self.self) }
    
    func start() {
        navigationController.delegate = self
        let homeVC = HomeVC()
        homeVC.coordinator = self
        navigationController.pushViewController(homeVC, animated: true
        )
    }
    
    func navigateProfileVC() {
        let profileCoordinator = ProfileCoordinator(navigationController: navigationController)
        profileCoordinator.parentCoordinator = self
        childCoordinators.append(profileCoordinator)
        profileCoordinator.start()
    }
    
    func navigateMessagesVC() {
        let messagesCoordinator = MessagesCoordinator(navigationController: navigationController)
        messagesCoordinator.parentCoordinator = self
        childCoordinators.append(messagesCoordinator)
        messagesCoordinator.start()
    }
}

extension HomeCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        if let profileVC = fromViewController as? ProfileVC {
            childDidFinish(profileVC.coordinator)
        }

        if let messagesVC = fromViewController as? MessagesVC {
            childDidFinish(messagesVC.coordinator)
        }
    }
}
