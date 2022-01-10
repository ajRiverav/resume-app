//
//  Language.swift
//  Resume
//
//  Created by AJ Rivera on 1/10/22.
//

import Foundation

// Each language has multiple properties that one can get.
// For instance, to get english's locale identifier, one simply calls `Language.english.localeIdentifier`
// and it returns "en".
enum Language {
    case english
    case spanish

    var localeIdentifier: String {
        switch self {
        case .english: return "en"
        case .spanish: return "es"
        }
    }
}
