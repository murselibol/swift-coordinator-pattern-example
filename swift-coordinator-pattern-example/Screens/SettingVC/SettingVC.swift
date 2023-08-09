//
//  SettingVC.swift
//  coordinator-pattern
//
//  Created by Mursel Elibol on 5.08.2023.
//

import UIKit

class SettingVC: UIViewController {
    
    weak var coordinator: SettingCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func tappedPrivacyBtn(_ sender: UIButton) {
        coordinator?.navigatePrivacy()
    }
}
