//
//  Icons.swift
//  Resume
//
//  Created by AJ Rivera on 12/30/21.
//

import Foundation
import UIKit

/// Avoids specifiying images using strings and instead uses an enum which offers compile-time checks.
enum Icon {
    case identificationCard
    case crane
    case maleStudent
    case pin
    case organigram
    case diploma
    case chevronRight

    /// Image for the icon
    var image: UIImage? {
        switch self {
            // TODO: DRY -> UIImage
        case .identificationCard: return UIImage(named: "identification card")
        case .crane: return UIImage(named: "crane")
        case .maleStudent: return UIImage(named: "male student")
        case .pin: return UIImage(named: "pin")
        case .diploma: return UIImage(named: "diploma")
        case .organigram: return UIImage(named: "organigram")
        case .chevronRight: return UIImage(named: "chevron right")
        }
    }

    /// Some icons require attribution to be use for free.
    var attribution: String? {
        switch self {
            // TODO: DRY -> make string a template
        case .identificationCard: return "Icon by https://freeicons.io/profile/3054 Nine One on https://freeicons.io"
        case .crane: return "Icon by https://freeicons.io/profile/2257 www.wishforge.games on https://freeicons.io"
        case .maleStudent: return nil
        case .pin, .organigram, .chevronRight: return "Icon by https://freeicons.io/profile/3 icon king1 on https://freeicons.io"
        case .diploma: return "Icon by https://freeicons.io/profile/5790 ColourCreatype on https://freeicons.io"
        }
    }
}
