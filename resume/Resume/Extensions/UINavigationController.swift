//
//  UINavigationController.swift
//  Resume
//
//  Created by AJ Rivera on 12/29/21.
//

import Foundation
import UIKit

extension UINavigationController {
    /// Sets the tab bar item's title on the tab bar controller displaying this navigation controller.
    func setTabBarItemTitle(_ title: String) {
        tabBarItem.title = title
    }

    /// Sets the tab bar item's image on the tab bar controller displaying this navigation controller.
    func setTabBarItemImage(_ image: UIImage?) {
        tabBarItem.image = image
    }

    // TODO: Hmm. Maybe we can move this override viewDidLoad here and call this? Calling this from every controller's viewDidLoad seems DRY.
    func setNavBarBackgroundColor(color: UIColor = .antiFlashWhite) {
        navigationBar.backgroundColor = color
    }
}
