//
//  ContactNavController.swift
//  Resume
//
//  Created by AJ Rivera on 12/29/21.
//

import Foundation
import UIKit

class ContactNavController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarItemTitle("contact".localized)
        setTabBarItemImage(UIImage(named: "telephone"))
    }
}
