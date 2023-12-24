//
//  HomeCoordinator.swift
//  coordinator-pattern
//
//  Created by Mursel Elibol on 5.08.2023.
//

import UIKit

class HomeCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    
    
    init() {
        print("Init", Self.self)
        navigationController = UINavigationController()
    }
    deinit { print("DeInit", Self.self) }
    
    lazy var homeVC: HomeVC = {
        let vc = HomeVC()
        vc.coordinator = self
        return vc
    }()
    
    func start() {
        navigationController!.setViewControllers([homeVC], animated: false)
    }
    
    func finishCoordinator() {
      childCoordinators.removeAll()
    }
    
    func navigateProfileVC() {}
    
    func navigateMessagesVC() {
        let messagesCoordinator = MessagesCoordinator(navigationController: navigationController!)
        messagesCoordinator.parentCoordinator = self
        childCoordinators.append(messagesCoordinator)
        messagesCoordinator.start()
    }
}
