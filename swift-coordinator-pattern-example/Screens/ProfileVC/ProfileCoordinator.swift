//
//  SettingCoordinator.swift
//  coordinator-pattern
//
//  Created by Mursel Elibol on 5.08.2023.
//

import UIKit

class ProfileCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    weak var parentCoordinator: HomeCoordinator?

    
    init() {
        print("Init", Self.self)
        navigationController = UINavigationController()
    }
    deinit { print("DeInit", Self.self) }
    
    lazy var profileVC: ProfileVC = {
        let vc = ProfileVC()
        vc.coordinator = self
        return vc
    }()
    
    func start() {
        navigationController!.setViewControllers([profileVC], animated: false)
    }
    
    func finishCoordinator() {
      childCoordinators.removeAll()
      parentCoordinator?.childDidFinish(self)
    }
    
    func navigateSettingVC() {
        let settingCoordinator = SettingCoordinator(navigationController: navigationController!)
        settingCoordinator.parentCoordinator = self
        childCoordinators.append(settingCoordinator)
        settingCoordinator.start()
    }

}
