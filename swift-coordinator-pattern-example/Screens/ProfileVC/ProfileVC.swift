//
//  ProfileVC.swift
//  coordinator-pattern
//
//  Created by Mursel Elibol on 5.08.2023.
//

import UIKit

class ProfileVC: UIViewController {
    
    weak var coordinator: ProfileCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    deinit {
        coordinator?.parentCoordinator?.childDidFinish(coordinator)
    }

    @IBAction func tappedSettingBtn(_ sender: UIButton) {
        coordinator?.navigateSettingVC()
    }
}
