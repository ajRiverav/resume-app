//
//  Date.swift
//  resume
//
//  Created by AJ Rivera on 12/28/21.
//

import Foundation

extension Date {
    // TODO: parameterize date format and locale identifier. They're harccoded for now.
    var localized: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: Language.english.localeIdentifier)
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: self)
    }
}

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
