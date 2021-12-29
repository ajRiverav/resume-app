//
//  SceneDelegate.swift
//  Resume
//
//  Created by AJ Rivera on 12/28/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var coordinator: RootCoordinator? // app needs a root coordinator to manage flows.

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard scene as? UIWindowScene != nil else { return }

        if let rootViewController = window?.rootViewController {
            // maybe inject
            coordinator = RootCoordinator(rootViewController: rootViewController)
        }
    }
}
