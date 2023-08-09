//
//  PrivacyVC.swift
//  coordinator-pattern
//
//  Created by Mursel Elibol on 6.08.2023.
//

import UIKit

class PrivacyVC: UIViewController {
    
    weak var coordinator: PrivacyCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func tappedBackBtn(_ sender: UIButton) {
        coordinator?.navigateBack()
    }
    
    
    @IBAction func tappedProfileBtn(_ sender: UIButton) {
        coordinator?.navigateProfileVC()
    }
    
    @IBAction func tappedHomeBtn(_ sender: UIButton) {
        coordinator?.navigateHomeVC()
    }
    
}
