//
//  ContactNavController.swift
//  Resume
//
//  Created by AJ Rivera on 12/29/21.
//

import Foundation
import UIKit

class SummaryNavController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarItemTitle("summary".localized)
        setTabBarItemImage(Icons.identificationCard.image)
    }
}
