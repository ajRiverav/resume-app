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
    var dates: Dates
    var description: [String] // an experience can have multiple descriptions
}

struct Place {
    var name: String
    var address: Address
}

struct Address {
    var state: State
    var city: City
}

struct Dates {
    var start: Date
    // Optional because some experiences may not have end date as they are current ones.
    var end: Date?
}

enum State {
    case puertoRico
    case maryland
    case districtOfColumbia
    case remote

    var displayString: String {
        switch self {
        case .puertoRico: return "Puerto Rico"
        case .maryland: return "Maryland"
        case .districtOfColumbia: return "District of Columbia"
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
        case .remote: return "Remote"
        }
    }
}

enum City {
    case patuxentRiver
    case sanJuan
    case washington
    case greenbelt
    case any

    var displayString: String {
        switch self {
        case .patuxentRiver: return "Patuxent River"
        case .sanJuan: return "San Juan"
        case .washington: return "Washington"
        case .greenbelt: return "Greenbelt"
        case .any: return "Any city"
        }
    }
}