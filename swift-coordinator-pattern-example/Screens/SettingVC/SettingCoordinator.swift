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
    var callBack: ((CoordinatorEventType) -> ())?
    
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
    
    func navigatePrivacy() {
        let privacyCoordinator = PrivacyCoordinator(navigationController: navigationController)
        privacyCoordinator.parentCoordinator = self
        addChild(coordinator: privacyCoordinator)
        privacyCoordinator.callBack = { [weak self] event in
            self?.privacyCoordinatorEvent(event: event)
        }
        privacyCoordinator.start()
    }
    
    func commonControllerToCoordinator(eventType: AppFlowEventType) {
        switch eventType {
        case .privacy:
            navigatePrivacy()
        case .finishController:
            callBack?(.finishCoordinator(coordinator: self))
        default:
            break
        }
    }
}

// MARK: - Coordinator To Coordinator
extension SettingCoordinator {
    private func resetCoordinator(coordinator: Coordinator) {
        self.removeChild(coordinator: coordinator)
    }
    
    private func privacyCoordinatorEvent(event: CoordinatorEventType) {
        switch event {
        case .finishCoordinator(let coordinator):
            resetCoordinator(coordinator: coordinator)
        }
    }
}
