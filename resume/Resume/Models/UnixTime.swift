//
//  UnixTime.swift
//  Resume
//
//  Created by AJ Rivera on 1/10/22.
//

import Foundation

enum UnixTime: TimeInterval {
    //
    // Left: the truncated, human readable date. Truncated because no time is specified, just the date.
    // Right: The approximate representation un UNIX time.
    //

    case year2002 = 1041303122
    case year2008 = 1230691922
    case year2013 = 1388458322
    case year2016 = 1483152722
    case year2018 = 1546224722
    case year2019 = 1546903773

    case dec2021 = 1640681463
    case jan2021 = 1611546165
    case apr2018 = 1524707522
    case mar2015 = 1426038722
    case jan2013 = 1357872722
    case sep2010 = 1284169922
    case may2008 = 1210470722
    case jun2007 = 1181526722
    case aug2007 = 1186797122
    case aug2010 = 1281205686

    // Helper to convert from unix time to date.
    var toDate: Date {
        Date(timeIntervalSince1970: rawValue)
    }
}
