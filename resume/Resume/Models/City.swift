//
//  City.swift
//  Resume
//
//  Created by AJ Rivera on 1/10/22.
//

import Foundation

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
