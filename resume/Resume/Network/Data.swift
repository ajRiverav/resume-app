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

// avoid DRY: reuse addresses
let washington = Address(state: .districtOfColumbia, city: .washington)
let sanJuan = Address(state: .puertoRico, city: .sanJuan)
let greenbelt = Address(state: .maryland, city: .greenbelt)
let paxRiver = Address(state: .maryland, city: .patuxentRiver)
let panamaCityBeach = Address(state: .florida, city: .panamaCityBeach)
let baltimore = Address(state: .maryland, city: .baltimore)
let aguadilla = Address(state: .puertoRico, city: .aguadilla)
let remote = Address(state: .remote, city: .any)

// MARK: - Experiences
let experienceList: [Experience] = [
    Experience(position: "Co-founder, Product Manager, and Frontend (React) Developer",
               place: Place(name: "CompuMED", address: remote),
               dates: Dates(start: UnixTime.jan2021.toDate,
                            end: UnixTime.dec2021.toDate),
               // swiftlint:disable line_length
               emphasisList: [
                Emphasis(title: "CompuMED is a startup focusing on the development of a proprietary home health management software."),
                Emphasis(title: "Technical responsibilities: fullstack development with React and NodeJS + TypeScript, automated end-to-end test development with Cypress.io, frontend deployment with AWS CloudFront + S3, backend deployment with AWS Elastic Beanstalk, usability testing."),
                Emphasis(title: "Administrative responsibilities:: product management, proposal writing, employee management, company finances."),
                Emphasis(title: "Accomplishments: Led a 4-member team in the development of v1.0 currently used by 1st paying customer (~40 users) on the field and in offices (tablets + desktops).")
               ]),
    // --------------------------------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------------------------
    Experience(position: "Co-founder, President, iOS Developer",
               place: Place(name: "Qualtics", address: remote),
               dates: Dates(start: UnixTime.apr2018.toDate,
                            end: UnixTime.jan2021.toDate),
               emphasisList: [
                Emphasis(title: "Qualtics was a software startup focused on developing software tools to help utility companies quickly identify outage magnitude and location using customers smartphones, reducing the need of expensive digital meters."),
                Emphasis(title: "Technical responsibilities: UX design and iOS development. Administrative responsibilities: strategic vision and execution, proposal writing, employee management, customer care, company finances."),
                Emphasis(title: "Launched proof-of-concept iOS app. Contributed to the UX/UI design and more than 50% of the iOS app. As of Jan 2, 2022, the app is still available on the App Store (apple.co/3tb0mJm)",
                         link: Link.appStoreApagonApp),
                Emphasis(title: "Wrote proposals and led meetings that helped Qualtics raise $95,000 of equity-free funding from different sources including a startup accelerator/app competition."),
                Emphasis(title: "Attained a ~$500,000 contract with a utility company for the development of a customized native mobile app (Android + iOS) and web app (React). Led a 5-member team in the development and delivery of v1.0 of the iOS and web apps.")
               ]),
    // --------------------------------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------------------------
    Experience(position: "Software Engineer in the Advanced Radars Branch",
               place: Place(name: "U.S. Naval Research Laboratory", address: washington),
               dates: Dates(start: UnixTime.mar2015.toDate,
                            end: UnixTime.apr2018.toDate),
               emphasisList: [
                Emphasis(title: "Led the design, development, and testing of a tracker system for a proof-of-concept radar named Flexible Distributed Array Radar (FlexDAR). Code written in both MATLAB (for rapid prototyping) and C++ (for the real-time system)."),
                Emphasis(title: "Developed the Functional Design Document for the tracker system where details about the implementation are discussed. This required knowledge of Kalman filters, data processing, statistical models, statistical hypothesis testing, and data association algorithms."),
                Emphasis(title: "Developed Python scripts used for statistical analyses (e.g. calculating the variance of non-stationary schothastic processes).")
               ]),
    // --------------------------------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------------------------
    Experience(position: "Software Engineer in the Acoustics Systems Division",
               place: Place(name: "Dept. of the Navy (NAVAIR)", address: paxRiver),
               dates: Dates(start: UnixTime.jan2013.toDate,
                            end: UnixTime.mar2015.toDate),
               emphasisList: [
                Emphasis(title: "Conducting signal processing research and development for a variety of sonar applications. Sonars are used to search for and locate submarines."),
                Emphasis(title: "Led a team of 4 engineers in the development, and verification and validation of a internal software tool that allows the U.S. government to conduct in-house, independent evaluations of new sonar algorithms before any significant investment of resources, time, and funding is made."),
                Emphasis(title: "Led a team of 6 engineers and scientists in the evaluation of a new signal processing algorithm using the internal tool above. Also, documented algorithm performance using Python code."),
                Emphasis(title: "Received funding for a 2-year machine learning research project after writing proposal."),
                Emphasis(title: "Served as a mentor for 2 new-hires in the areas of signal & information processing.")
               ]),
    // --------------------------------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------------------------
    Experience(position: "Software Engineer",
               place: Place(name: "Dept. of the Navy (NAVSEA)", address: panamaCityBeach),
               dates: Dates(start: UnixTime.sep2010.toDate,
                            end: UnixTime.jan2013.toDate),
               emphasisList: [Emphasis(title: "Worked on a communications system between a navy ship and unmanned vehicles")]),
    // --------------------------------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------------------------
    Experience(position: "Software Engineer",
               place: Place(name: "Honeywell Aerospace", address: aguadilla),
               dates: Dates(start: UnixTime.may2008.toDate,
                            end: UnixTime.aug2010.toDate),
               emphasisList: [
                Emphasis(title: "Worked on a weather radar system."),
                Emphasis(title: "Designed, implemented, and tested software improvements (C++).")
               ]),
    // --------------------------------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------------------------
    Experience(position: "Software Engineer Intern in the Microwave Instrument and Technology Branch",
               place: Place(name: "NASA", address: greenbelt),
               dates: Dates(start: UnixTime.jun2007.toDate,
                            end: UnixTime.aug2007.toDate),
               emphasisList: [
                Emphasis(title: "Supported team working on an airborne radar being developed at NASA Goddard Space Flight Center that combines electronic beam scanning and digital beam forming technologies."),
                Emphasis(title: "Developed and implemented signal processing algorithms in MATLAB to compensate for aircraft roll observed in radar measurements.")
               ]),
    // --------------------------------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------------------------
    Experience(position: "Volunteer",
               place: Place(name: "Cenadores (Non-profit)", address: washington),
               dates: Dates(start: UnixTime.year2016.toDate,
                            end: UnixTime.year2019.toDate),
               emphasisList: [
                Emphasis(title: "Involved in the design and execution of the organization’s financial literacy pilot project, whose goal is to increase the financial knowledge of high-school students in Puerto Rico."),
                Emphasis(title: "Developed and taught the Income and Investments modules to a group of 30 students.")
               ])
]

// MARK: - Education
let educationList: [Education] = [
    Education(place: Place(name: "Johns Hopkins University", address: baltimore),
              degree: "Master of Science in Electrical and Computer Engineering",
              dates: Dates(start: UnixTime.year2013.toDate, end: UnixTime.year2016.toDate),
              emphasistList: ["Major area of study: Machine Learning/Signal Processing.",
                              "Final Work: 'Prediction of stock price direction near support levels using an Artificial Neural Network'"]),
    Education(place: Place(name: "Polytechnic University of PR", address: sanJuan),
              degree: "Bachelor of Science in Electrical Engineering",
              dates: Dates(start: UnixTime.year2002.toDate, end: UnixTime.year2008.toDate),
              emphasistList: ["Major area of study: Software Development/Signal Processing.",
                              "Conducted undergraduate research in computational electromagnetics."])
]

// MARK: - Summary
let highlightList: [Highlight] = [
    Highlight(title: "Summary",
              emphasisList: [
                Emphasis(title: "Software engineer/data scientist with over 10 years of experience in scientific and web programming. Passionate about anything finance.")]),
    Highlight(title: "Programming Languages & Tools",
              emphasisList: [
                Emphasis(title: "Web Programming: Swift/iOS (UIKit, WebKit), React-Native (iOS), React, NodeJS+Typescript, GraphQL."),
                Emphasis(title: "Scientific Programming: Python (Numpy, SciPy, Pandas, Scikit-learn, Jupyter), C++, Eigen Linear Algebra C++ Library, MATLAB."),
                Emphasis(title: "Other Tools: Xcode, Git, Git-LFS, Github, Gitlab, VSCode.")
              ]),
    Highlight(title: "Online accounts/repositories",
              emphasisList: [
                Emphasis(title: "This app's source code", link: .resumeAppRepository),
                Emphasis(title: "AJ's Github account", link: .github),
                Emphasis(title: "AJ's Gitlab account", link: .gitlab)
              ])
]
