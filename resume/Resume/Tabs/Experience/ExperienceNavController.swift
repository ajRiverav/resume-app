//
//  ExperienceNavController.swift
//  Resume
//
//  Created by AJ Rivera on 12/29/21.
//

import Foundation
import UIKit

class ExperienceNavController: UINavigationController {
    override func awakeFromNib() {
        super.awakeFromNib()
        setTabBarItemTitle(LocalizableString.experience.localized)
        setTabBarItemImage(Icon.crane.image)
    }
}
