//
//  State.swift
//  Resume
//
//  Created by AJ Rivera on 1/10/22.
//

import Foundation

enum State {
    case puertoRico
    case maryland
    case districtOfColumbia
    case florida
    case remote

    var displayString: String {
        switch self {
        case .puertoRico: return "Puerto Rico"
        case .maryland: return "Maryland"
        case .districtOfColumbia: return "District of Columbia"
        case .florida: return "Florida"
        case .remote: return "Remote"
        }
    }

    // Using Postal abbreviations (as of Dec. 28, 2021) per USPS.
    // Ref. https://about.usps.com/who-we-are/postal-history/state-abbreviations.htm
    var postalAbbreviation: String {
        switch self {
        case .puertoRico: return "PR"
        case .maryland: return "MD"
        case .districtOfColumbia: return "DC"
        case .florida: return "FL"
        case .remote: return "Remote"
        }
    }
}
