//
//  models.swift
//  resume
//
//  Created by AJ Rivera on 12/28/21.
//

import Foundation

//
// Normally, one would create multiple files for different models used thoughout the app.
// For simplicity, all are listed here.
//

struct Experience {
    var position: String
    var place: Place
    var duration: Duration
    var description: String
}

struct Place {
    var name: String
    var address: Address
}

struct Address {
    var state: State
    var city: City
}

struct Duration {
    var start: Date
    // Optional because some experiences may not have end date as they are current ones.
    var end: Date?
}

enum State {
    case pr
    case md
    case dc

    var name: String {
        switch self {
        case .pr: return "Puerto Rico"
        case .md: return "Maryland"
        case .dc: return "District of Columbia"
        }
    }

    // Using Postal abbreviations (as of Dec. 28, 2021) per USPS.
    // Ref. https://about.usps.com/who-we-are/postal-history/state-abbreviations.htm
    var postalAbbreviation: String {
        switch self {
        case .pr: return "PR"
        case .md: return "MD"
        case .dc: return "DC"
        }
    }
}

enum City {
    case patuxentRiver
    case sanJuan
    case washington

    var name: String {
        switch self {
        case .patuxentRiver: return "Patuxent River"
        case .sanJuan: return "San Juan"
        case .washington: return "Washington"
        }
    }
}
