//
//  SettingCoordinator.swift
//  coordinator-pattern
//
//  Created by Mursel Elibol on 5.08.2023.
//

import UIKit

class SettingCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    weak var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        print("Init", Self.self)
        self.navigationController = navigationController
    }
    deinit { print("DeInit", Self.self) }
    
    func start() {
        let settingVC = SettingVC()
        settingVC.coordinator = self
        navigationController.pushViewController(settingVC, animated: true)
    }
    
    func finishCoordinator() {
      childCoordinators.removeAll()
      parentCoordinator?.childDidFinish(self)
    }
    
    func navigatePrivacy() {
        let privacyCoordinator = PrivacyCoordinator(navigationController: navigationController)
        privacyCoordinator.parentCoordinator = self
        childCoordinators.append(privacyCoordinator)
        privacyCoordinator.start()
    }
    

}

