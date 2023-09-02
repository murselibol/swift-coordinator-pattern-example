//
//  MessagesVC.swift
//  coordinator-pattern
//
//  Created by Mursel Elibol on 5.08.2023.
//

import UIKit

class MessagesVC: UIViewController {
    
    weak var coordinator: MessagesCoordinator?

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
