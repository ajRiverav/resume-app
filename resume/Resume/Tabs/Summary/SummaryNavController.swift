//
//  ContactNavController.swift
//  Resume
//
//  Created by AJ Rivera on 12/29/21.
//

import Foundation
import UIKit

class SummaryNavController: UINavigationController {
    override func awakeFromNib() {
        super.awakeFromNib()
        // defaults
        setTabBarItemTitle(LocalizableString.summary.localized)
        setTabBarItemImage(Icon.identificationCard.image)
    }
}
