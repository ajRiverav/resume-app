//
//  ExperienceNavController.swift
//  Resume
//
//  Created by AJ Rivera on 12/29/21.
//

import Foundation
import UIKit

class ExperienceNavController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()       
        setTabBarItemTitle("experience".localized)
        setTabBarItemImage(Icon.crane.image)
    }
}
