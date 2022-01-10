//
//  EducationNavController.swift
//  Resume
//
//  Created by AJ Rivera on 12/29/21.
//

import Foundation
import UIKit

class EducationNavController: UINavigationController {
    override func awakeFromNib() {
        super.awakeFromNib()
        // defaults
        setTabBarItemTitle(LocalizableString.education.localized)
        setTabBarItemImage(Icon.maleStudent.image)
    }
}
