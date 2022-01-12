//
//  UITabController.swift
//  Resume
//
//  Created by AJ Rivera on 1/7/22.
//

import Foundation
import UIKit

extension UITabBarController {w
    override open func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
}

private extension UITabBarController {
    func configure() {
        setTabBarBackgroundColor()
    }

    func setTabBarBackgroundColor(color: UIColor = .antiFlashWhite) {
        tabBar.backgroundColor = color
    }
}
