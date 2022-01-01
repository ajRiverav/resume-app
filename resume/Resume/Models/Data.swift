//
//  Data.swift
//  Resume
//
//  Created by AJ Rivera on 12/30/21.
//

import Foundation

//
// The data one would otherwise get from fetching an API. To simplify this app, this is hardcoded.
//

enum UnixTime: TimeInterval {
    //
    // Left: the truncated, human readable date. Truncated because no time is specified, just the date.
    // Right: The approximate representation un UNIX time.
    //

    case year2018 = 1546224722
    case year2013 = 1388458322
    case year2016 = 1483152722
    case year2002 = 1041303122
    case year2008 = 1230691922

    case dec2021 = 1640681463
    case jan2021 = 1611546165
    case apr2018 = 1524707522
    case mar2015 = 1426038722
    case jan2013 = 1357872722
    case sep2010 = 1284169922
    case may2008 = 1210470722
    case jun2007 = 1181526722
    case aug2007 = 1186797122

    // Helper to convert from unix time to date.
    var toDate: Date {
        Date(timeIntervalSince1970: rawValue)
    }
}

// avoid DRY: reuse addresses
var washington = Address(state: .districtOfColumbia, city: .washington)
var sanJuan = Address(state: .puertoRico, city: .sanJuan)
var greenbelt = Address(state: .maryland, city: .greenbelt)
var remote = Address(state: .remote, city: .any)

var experiences: [Experience] = [
    Experience(position: "Co-founder, Product Manager",
               place: Place(name: "CompuMED", address: remote),
               dates: Dates(start: UnixTime.jan2021.toDate,
                            end: UnixTime.dec2021.toDate),
               // swiftlint:disable line_length
               description: ["Qualtics was a software startup focusing on the development of complex enterprise software development for mobile (iOS and Android) and desktop(Windows, Linux, and macOS) platforms.",
                             "lere lejrij fijeijf aijaijf ijasijfija aijaisjfaisjfj faiajasijfija asijfa",
                             "lere lejrij fijeijf aijaijf ijasijfija aijaisjfaisjfj faiajasijfija asijfa"]),
    Experience(position: "Co-founder, President, iOS developer",
               place: Place(name: "QUALTICS", address: remote),
               dates: Dates(start: UnixTime.apr2018.toDate,
                            end: UnixTime.jan2021.toDate),
               description: ["task1", "task2", "task3"])
]
