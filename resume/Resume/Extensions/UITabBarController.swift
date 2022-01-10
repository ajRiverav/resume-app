//
//  UITabController.swift
//  Resume
//
//  Created by AJ Rivera on 1/7/22.
//

import Foundation
import UIKit

extension UITabBarController {
    override open func awakeFromNib() {
        super.awakeFromNib()
        configureTabBar()
    }
}

private extension UITabBarController {
    func configureTabBar() {
        setTabBarBackgroundColor()
    }

    func setTabBarBackgroundColor(color: UIColor = .antiFlashWhite) {
        tabBar.backgroundColor = color
    }
}
