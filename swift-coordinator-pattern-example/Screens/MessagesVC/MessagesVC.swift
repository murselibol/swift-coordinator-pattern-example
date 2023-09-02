//
//  MessagesVC.swift
//  coordinator-pattern
//
//  Created by Mursel Elibol on 5.08.2023.
//

import UIKit

class MessagesVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func tappedSettingBtn(_ sender: UIButton) {
        coordinator?.commonControllerToCoordinator(eventType: .setting)
    }
}
