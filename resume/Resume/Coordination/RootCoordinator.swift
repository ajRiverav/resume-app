//
//  RootCoordinator.swift
//  Resume
//
//  Created by AJ Rivera on 12/29/21.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    // A coordinator must know their root view controller.
    var rootViewController: UIViewController? { get }

    // TODO: A coordinator must allow their view controllers to be configured.
    func configure(_ viewController: UIViewController)
}

protocol ChildCoordinatorProtocol: CoordinatorProtocol {
    // All child coordinators must know their parent.
  var parent: CoordinatorProtocol? { get set }
}

protocol RootCoordinated: AnyObject {
    var rootCoordinator: RootCoordinator? { get set }
}

class RootCoordinator {
    //
    var rootViewController: UIViewController?

    // child coordinators
    // TODO: experienceCoordinator
    // TODO: educationCoordinator
    // TODO: contactCoordinator

    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController

        // TODO: assign parent to instantiated coordinators
        // let child coordinators know who their parent is in case they need to reference it.
        //        experienceCoordinator.parent = experienceCoordinator

        configure(rootViewController)
    }
}

extension RootCoordinator: CoordinatorProtocol {
    func configure(_ viewController: UIViewController) {
        // Maybe inject dependencies.
        (viewController as? RootCoordinated)?.rootCoordinator = self
        // TODO:
        //    (viewController as? ExperienceCoordinated)?.experienceCoordinator = experienceCoordinator

        // For navigation controllers, only inject into their *root* view controller,
        // which is the one that's initially instantiated.
        (viewController as? UINavigationController)?.viewControllers.first.map(configure)

        // For tab bar controllers, inject every child because they're all instantiated on load.
        (viewController as? UITabBarController)?.viewControllers?.forEach(configure)

        // For controllers having children, inject every child because they're all instantiated on load.
        viewController.children.forEach(configure)

        // Some view controllers need their views loaded during configuration so that
        // their view models can be properly set. Chiefly because many view models
        // contain references to IBOutlets which can only be set after loading the view.
        // Attempting to set an IBOutlet without loading its view causes a runtime error.
        viewController.loadViewIfNeeded()
    }
}
