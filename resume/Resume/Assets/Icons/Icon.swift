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

    /// Image for the icon
    var image: UIImage? {
        switch self {
            // TODO: DRY -> UIImage
        case .identificationCard: return UIImage(named: "identification card")
        case .crane: return UIImage(named: "crane")
        case .maleStudent: return UIImage(named: "male student")
        }
    }

    /// Some icons require attribution to be use for free.
    var attribution: String? {
        switch self {
        case .identificationCard: return "Icon by https://freeicons.io/profile/3054 Nine One on https://freeicons.io"
        case .crane: return "Icon by https://freeicons.io/profile/2257 www.wishforge.games on https://freeicons.io"
        case .maleStudent: return nil
        }
    }
}

// TODO:
// id card                                     Icon by <a href="https://freeicons.io/profile/3054">Nine One</a> on <a href="https://freeicons.io">freeicons.io</a>

// graduation                                     Icon by <a href="https://freeicons.io/profile/2257">www.wishforge.games</a> on <a href="https://freeicons.io">freeicons.io</a>

// pin                                     Icon by <a href="https://freeicons.io/profile/3">icon king1</a> on <a href="https://freeicons.io">freeicons.io</a>

// diploma                                     Icon by <a href="https://freeicons.io/profile/5790">ColourCreatype</a> on <a href="https://freeicons.io">freeicons.io</a>

// crane                                     Icon by <a href="https://freeicons.io/profile/2257">www.wishforge.games</a> on <a href="https://freeicons.io">freeicons.io</a>
