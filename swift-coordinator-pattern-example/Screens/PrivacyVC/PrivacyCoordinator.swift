//
//  SettingCoordinator.swift
//  coordinator-pattern
//
//  Created by Mursel Elibol on 5.08.2023.
//

import UIKit

class PrivacyCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    weak var parentCoordinator: Coordinator?
    var callBack: ((CoordinatorEventType) -> ())?
    
    init(navigationController: UINavigationController) {
        print("Init", Self.self)
        self.navigationController = navigationController
    }
    deinit { print("DeInit", Self.self) }
    
    func start() {
        let privacyVC = PrivacyVC()
        privacyVC.coordinator = self
        navigationController.pushViewController(privacyVC, animated: true)
    }
    
    func navigateBack() {
        navigationController.popViewController(animated: true)
    }
    
    func navigateProfileVC() {
        if let profileViewController = navigationController.viewControllers.first(where: { $0 is ProfileVC }) {
            navigationController.popToViewController(profileViewController, animated: true)
        }
    }
    
    func navigateHomeVC() {
        navigationController.popToRootViewController(animated: true)
    }
    
    func commonControllerToCoordinator(eventType: AppFlowEventType) {
        switch eventType {
        case .back:
            navigateBack()
        case .profile:
            navigateProfileVC()
        case .home:
            navigateHomeVC()
        case .finishController:
            callBack?(.finishCoordinator(coordinator: self))
        default:
            break
        }
    }
}
