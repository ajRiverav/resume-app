//
//  Date.swift
//  resume
//
//  Created by AJ Rivera on 12/28/21.
//

import Foundation

extension Date {
    enum Format: String {
        case MMM
        case yyyy
    }

    // TODO: Idea: overload and use [Format] that way one can call it [.yyyy, .MMM]
    func formatted(as format: Format,
                   in language: Language = .english) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .init(identifier: language.localeIdentifier)
        dateFormatter.dateFormat = format.rawValue
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
