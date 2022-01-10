//
//  UINavigationController.swift
//  Resume
//
//  Created by AJ Rivera on 12/29/21.
//

import Foundation
import UIKit

extension UINavigationController {
    open override func awakeFromNib() {
        super.awakeFromNib()
        configureNavBar()
    }
    /// Sets the tab bar item's title on the tab bar controller displaying this navigation controller.
    func setTabBarItemTitle(_ title: String) {
        tabBarItem.title = title
    }

    /// Sets the tab bar item's image on the tab bar controller displaying this navigation controller.
    func setTabBarItemImage(_ image: UIImage?) {
        tabBarItem.image = image
    }
}

private extension UINavigationController {
    private func configureNavBar() {
        setNavBarBackgroundColor()
        navigationBar.prefersLargeTitles = true

    }
    private func setNavBarBackgroundColor(color: UIColor = .antiFlashWhite) {
        navigationBar.backgroundColor = color
    }
}
