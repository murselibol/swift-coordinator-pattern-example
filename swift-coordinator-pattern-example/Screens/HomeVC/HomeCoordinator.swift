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
