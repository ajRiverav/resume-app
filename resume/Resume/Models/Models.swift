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
    var emphasisList: [Emphasis]
}

struct Education {
    var place: Place
    var degree: String
    var dates: Dates
    var emphasistList: [String]
}

struct Emphasis {
    var title: String
    var link: Link?

    init(title: String, link: Link) {
        self.title = title
        self.link = link
    }

    init(title: String) {
        self.title = title
        link = nil
    }
}

struct Highlight {
    var title: String
    var emphasisList: [Emphasis]
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
    // Optional because some experiences may not have end date as they are current.
    var end: Date?
}

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

enum City {
    case patuxentRiver
    case sanJuan
    case washington
    case greenbelt
    case baltimore
    case panamaCityBeach
    case aguadilla
    case any

    var displayString: String {
        switch self {
        case .patuxentRiver: return "Patuxent River"
        case .sanJuan: return "San Juan"
        case .washington: return "Washington"
        case .greenbelt: return "Greenbelt"
        case .any: return "Worldwide"
        case .baltimore: return "Baltimore"
        case .panamaCityBeach: return "Panama City Beach"
        case .aguadilla: return "Aguadilla"
        }
    }
}

enum Link {
    case github
    case gitlab
    case resumeAppRepository
    case apagonApp

    var urlAsString: String {
        switch self {
        case .github: return "https://github.com/ajriverav"
        case .gitlab: return "https://gitlab.com/ajriverav"
        case .resumeAppRepository: return "https://github.com/ajRiverav/resume-app"
        case .apagonApp:
            #if targetEnvironment(simulator)
            return "http://google.com/search?q=apagonapp+app+store&oq=apagonapp+app"
            #else
            return "https://apps.apple.com/app/apag%C3%B3n-app/id1362697139"
            #endif
        }
    }
}
