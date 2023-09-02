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
    var callBack: ((CoordinatorEventType) -> ())?
    
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
    
    func navigateSettingVC() {
        let settingCoordinator = SettingCoordinator(navigationController: navigationController)
        settingCoordinator.parentCoordinator = self
        addChild(coordinator: settingCoordinator)
        settingCoordinator.callBack = { [weak self] event in
            self?.settingCoordinatorEvent(event: event)
        }
        settingCoordinator.start()
    }

    func commonControllerToCoordinator(eventType: AppFlowEventType) {
        switch eventType {
        case .setting:
            navigateSettingVC()
        case .finishController:
            callBack?(.finishCoordinator(coordinator: self))
        default:
            break
        }
    }
}


// MARK: - Coordinator To Coordinator
extension ProfileCoordinator {
    private func resetCoordinator(coordinator: Coordinator) {
        self.removeChild(coordinator: coordinator)
    }
    
    private func settingCoordinatorEvent(event: CoordinatorEventType) {
        switch event {
        case .finishCoordinator(let coordinator):
            resetCoordinator(coordinator: coordinator)
        }
    }
}
