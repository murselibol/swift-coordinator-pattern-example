//
//  BaseVC.swift
//  swift-coordinator-pattern-example
//
//  Created by Mursel Elibol on 2.09.2023.
//

import UIKit

class BaseVC: UIViewController {
    
    weak var coordinator: Coordinator?
    
    deinit {
        coordinator?.commonControllerToCoordinator(eventType: .finishController)
    }
}
