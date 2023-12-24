//
//  MainCoordinator.swift
//  swift-coordinator-pattern-example
//
//  Created by Mursel Elibol on 24.12.2023.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    var rootViewController: UITabBarController
    var childCoordinators = [Coordinator]()
    
    init() {
        print("Init", Self.self)
        self.rootViewController = UITabBarController()
        rootViewController.tabBar.isTranslucent = true
        rootViewController.tabBar.backgroundColor = .systemGray2
    }
    
    func start() {
        let homeCoordinator = HomeCoordinator()
        homeCoordinator.start()
        self.childCoordinators.append(homeCoordinator)
        let homeVC = homeCoordinator.homeVC
        setup(vc: homeVC, title: "Home", imageName: "house", selectdImageName: "house.fill")
        
        let profileCoordinator = ProfileCoordinator()
        profileCoordinator.start()
        self.childCoordinators.append(profileCoordinator)
        let profileVC = profileCoordinator.profileVC
        setup(vc: profileVC, title: "Profile", imageName: "person", selectdImageName: "person.fill")
        
        self.rootViewController.viewControllers = [homeCoordinator.navigationController!, profileCoordinator.navigationController!]
    }
    
    func setup(vc: UIViewController, title: String, imageName: String, selectdImageName: String) {
        let defaultImage = UIImage(systemName: imageName)
        let selectedImage = UIImage(systemName: selectdImageName)
        let tabBarItem = UITabBarItem(title: title, image: defaultImage, selectedImage: selectedImage)
        vc.tabBarItem = tabBarItem
    }
    
    func finishCoordinator() {}
}
    

