//
//  HomeVC.swift
//  coordinator-pattern
//
//  Created by Mursel Elibol on 5.08.2023.
//

import UIKit

class HomeVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tappedProfileBtn(_ sender: UIButton) {
        coordinator?.commonControllerToCoordinator(eventType: .profile)
    }
    
    @IBAction func tappedMessagesBtn(_ sender: UIButton) {
        coordinator?.commonControllerToCoordinator(eventType: .messages)
    }
    
}
