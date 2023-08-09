//
//  HomeVC.swift
//  coordinator-pattern
//
//  Created by Mursel Elibol on 5.08.2023.
//

import UIKit

class HomeVC: UIViewController {
    
    weak var coordinator: HomeCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func tappedProfileBtn(_ sender: UIButton) {
        coordinator?.navigateProfileVC()
    }
    
    @IBAction func tappedMessagesBtn(_ sender: UIButton) {
        coordinator?.navigateMessagesVC()
    }
    
}
