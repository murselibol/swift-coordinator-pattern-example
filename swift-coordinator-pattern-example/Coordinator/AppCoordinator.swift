//
//  AppCoordinator.swift
//  swift-coordinator-pattern-example
//
//  Created by Mursel Elibol on 24.12.2023.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    let window: UIWindow
    var childCoordinators = [Coordinator]()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let mainCoordinator = MainCoordinator()
        mainCoordinator.start()
        self.childCoordinators = [mainCoordinator]
        window.rootViewController = mainCoordinator.rootViewController
    }
    
    func finishCoordinator() {}
}
