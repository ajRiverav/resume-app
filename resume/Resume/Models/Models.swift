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
    let position: String
    let place: Place
    let dates: Dates
    let emphasisList: [Emphasis]
}

struct Education {
    let place: Place
    let degree: String
    let dates: Dates
    let emphasistList: [String]
}

struct Emphasis {
    let title: String
    let webLink: WebLink?

    init(title: String, webLink: WebLink) {
        self.title = title
        self.webLink = webLink
    }

    init(title: String) {
        self.title = title
        webLink = nil
    }
}

struct Highlight {
    let title: String
    let emphasisList: [Emphasis]
}

struct Place {
    let name: String
    let address: Address
}

struct Address {
    let state: State
    let city: City
}

struct Dates {
    let start: Date
    // Optional because some experiences may not have end date as they are current.
    let end: Date?
}
