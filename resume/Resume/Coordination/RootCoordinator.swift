//
//  RootCoordinator.swift
//  Resume
//
//  Created by AJ Rivera on 12/29/21.
//

import Foundation
import UIKit

// Any coordinator must allow it to be configured.
protocol Coordinator: AnyObject {
    func configure(viewController: UIViewController)
}

protocol RootCoordinated: AnyObject {
    var rootCoordinator: RootCoordinator? { get set }
}

/// The root coordinator orchestrates vc flow while it helps with separation of concerns.
/// Each tab gets its own child coordinator if needed.
class RootCoordinator: NSObject {
    let summaryCoordinator = SummaryCoordinator()
    let experienceCoordinator = ExperienceCoordinator()

    override init() {
        super.init()
        summaryCoordinator.parent = self
        experienceCoordinator.parent = self
    }
}

// MARK: Implementation
extension RootCoordinator: Coordinator {
    func configure(viewController: UIViewController) {
        (viewController as? RootCoordinated)?.rootCoordinator = self
        (viewController as? SummaryCoordinated)?.summaryCoordinator = summaryCoordinator
        (viewController as? ExperienceCoordinated)?.experienceCoordinator = experienceCoordinator

        if let tabBarController = viewController as? UITabBarController {
            tabBarController.viewControllers?.forEach(configure(viewController:))
        }
        if let navigationController = viewController as? UINavigationController,
            let rootViewController = navigationController.viewControllers.first {
            configure(viewController: rootViewController)
        }

    }
}
