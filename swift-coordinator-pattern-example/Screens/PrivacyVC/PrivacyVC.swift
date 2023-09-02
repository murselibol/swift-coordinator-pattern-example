//
//  PrivacyVC.swift
//  coordinator-pattern
//
//  Created by Mursel Elibol on 6.08.2023.
//

import UIKit

class PrivacyVC: BaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func tappedBackBtn(_ sender: UIButton) {
        coordinator?.commonControllerToCoordinator(eventType: .back)
    }
    
    @IBAction func tappedProfileBtn(_ sender: UIButton) {
        coordinator?.commonControllerToCoordinator(eventType: .profile)
    }
    
    @IBAction func tappedHomeBtn(_ sender: UIButton) {
        coordinator?.commonControllerToCoordinator(eventType: .home)
    }
    
}
