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
    var link: WebLink?

    init(title: String, webLink: WebLink) {
        self.title = title
        self.link = webLink
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
