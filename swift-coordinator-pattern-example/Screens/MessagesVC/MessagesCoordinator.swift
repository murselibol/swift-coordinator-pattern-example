//
//  MessagesCoordinator.swift
//  coordinator-pattern
//
//  Created by Mursel Elibol on 5.08.2023.
//

import UIKit

class MessagesCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    weak var parentCoordinator: HomeCoordinator?
    
    init(navigationController: UINavigationController) {
        print("Init", Self.self)
        self.navigationController = navigationController
    }
    deinit { print("DeInit", Self.self) }
    
    func start() {
        let messagesVC = MessagesVC()
        messagesVC.coordinator = self
        navigationController?.pushViewController(messagesVC, animated: true)
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
