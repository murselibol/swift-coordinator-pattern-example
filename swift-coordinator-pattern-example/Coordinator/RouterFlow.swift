//
//  RouterFlow.swift
//  swift-coordinator-pattern-example
//
//  Created by Mursel Elibol on 2.09.2023.
//

import Foundation

import Foundation

/// Coordinator ile Controller arasındaki iletişimi sağlar.
enum AppFlowEventType {
    case home, profile, messages, setting, privacy, back, finishController
}

/// Coordinatorler arası iletişimi sağlar. Sadece iki coordinator arasında kullanılır.
enum CoordinatorEventType {
    case finishCoordinator(coordinator: Coordinator)
}
