//
//  SceneDelegate.swift
//  Resume
//
//  Created by AJ Rivera on 12/28/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var coordinator = RootCoordinator()

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard scene as? UIWindowScene != nil else { return }

        if let rootViewController = window?.rootViewController {
            coordinator.configure(viewController: rootViewController)
        }
    }
}
