//
//  String.swift
//  Resume
//
//  Created by AJ Rivera on 12/29/21.
//

import Foundation

protocol Localizable {
    /// Get the localized version of the caller using a more consice syntax.
    ///
    /// A welcome message can be localized by calling its localized property:
    /// ```
    /// "welcome".localized
    /// ```
    var localized: String { get }
}

extension String: Localizable {
    var localized: String {
        // No need to have a comment, hence the "". See param description. 
        let localizedString = NSLocalizedString(self, comment: "")
        return localizedString
    }
}
