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
    var callBack: ((CoordinatorEventType) -> ())?
    
    init(navigationController: UINavigationController) {
        print("Init", Self.self)
        self.navigationController = navigationController
    }
    
    deinit { print("DeInit", Self.self) }
    
    func start() {
        navigationController.delegate = self
        let homeVC = HomeVC()
        homeVC.coordinator = self
        navigationController.pushViewController(homeVC, animated: true)
    }
    
    func navigateProfileVC() {
        let profileCoordinator = ProfileCoordinator(navigationController: navigationController)
        profileCoordinator.parentCoordinator = self
        addChild(coordinator: profileCoordinator)
        profileCoordinator.callBack = { [weak self] event in
            self?.profileCoordinatorEvent(event: event)
        }
        profileCoordinator.start()
    }
    
    func navigateMessagesVC() {
        let messagesCoordinator = MessagesCoordinator(navigationController: navigationController)
        messagesCoordinator.parentCoordinator = self
        addChild(coordinator: messagesCoordinator)
        messagesCoordinator.callBack = { [weak self] event in
            self?.messagesCoordinatorEvent(event: event)
        }
        messagesCoordinator.start()
    }
    
    func commonControllerToCoordinator(eventType: AppFlowEventType) {
        switch eventType {
        case .profile:
            navigateProfileVC()
        case .messages:
            navigateMessagesVC()
        default:
            break
        }
    }
}


// MARK: - Coordinator To Coordinator
extension HomeCoordinator {
    private func resetCoordinator(coordinator: Coordinator) {
        self.removeChild(coordinator: coordinator)
    }
    
    private func profileCoordinatorEvent(event: CoordinatorEventType) {
        switch event {
        case .finishCoordinator(let coordinator):
            resetCoordinator(coordinator: coordinator)
        }
    }
    
    private func messagesCoordinatorEvent(event: CoordinatorEventType) {
        switch event {
        case .finishCoordinator(let coordinator):
            resetCoordinator(coordinator: coordinator)
        }
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
