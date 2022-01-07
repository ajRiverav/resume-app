//
//  UITabController.swift
//  Resume
//
//  Created by AJ Rivera on 1/7/22.
//

import Foundation
import UIKit

extension UITabBarController {
    // TODO: Hmm. Maybe we can move this override viewDidLoad here and call this? Calling this from every controller's viewDidLoad seems DRY.
    func setTabBarBackgroundColor(color: UIColor = .antiFlashWhite) {
        tabBar.backgroundColor = color
    }
}
