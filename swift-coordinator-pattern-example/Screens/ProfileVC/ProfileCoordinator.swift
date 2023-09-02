//
//  SettingCoordinator.swift
//  coordinator-pattern
//
//  Created by Mursel Elibol on 5.08.2023.
//

import UIKit

class ProfileCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    weak var parentCoordinator: HomeCoordinator?
    
    init(navigationController: UINavigationController) {
        print("Init", Self.self)
        self.navigationController = navigationController
    }
    deinit { print("DeInit", Self.self) }
    
    func start() {
        let profileVC = ProfileVC()
        profileVC.coordinator = self
        navigationController.pushViewController(profileVC, animated: true)
    }
    
    func finishCoordinator() {
      childCoordinators.removeAll()
      parentCoordinator?.childDidFinish(self)
    }
    
    func navigateSettingVC() {
        let settingCoordinator = SettingCoordinator(navigationController: navigationController)
        settingCoordinator.parentCoordinator = self
        childCoordinators.append(settingCoordinator)
        settingCoordinator.start()
    }

}
