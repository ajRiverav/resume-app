//
//  String.swift
//  Resume
//
//  Created by AJ Rivera on 12/30/21.
//

import Foundation

/// Avoids specifiying localizable strings using strings and instead uses an enum which offers compile-time checks..
enum LocalizableString {
    case education
    case experience
    case summary
    case ajRiveraResume

    /// Computed property is used because raw values requires literals. 
    var localized: String {
        switch self {
        case .education: return "education".localized
        case .experience: return "experience".localized
        case .summary: return "summary".localized
        case .ajRiveraResume: return "AJ Rivera's resume".localized
        }
    }
}
