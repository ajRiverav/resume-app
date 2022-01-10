//
//  Link.swift
//  Resume
//
//  Created by AJ Rivera on 1/10/22.
//

import Foundation

enum WebLink {
    case github
    case gitlab
    case resumeAppRepository
    case apagonApp
    case email
    case cenadores

    var urlAsString: String {
        switch self {
        case .github: return "https://github.com/ajriverav"
        case .gitlab: return "https://gitlab.com/ajriverav"
        case .resumeAppRepository: return "https://github.com/ajRiverav/resume-app"
        case .apagonApp:
            #if targetEnvironment(simulator)
            // simulator cannot open app store links as it does not have the app store app.
            return "http://google.com/search?q=apagonapp+app+store&oq=apagonapp+app"
            #else
            return "https://apps.apple.com/app/apag%C3%B3n-app/id1362697139"
            #endif
        case .email: return "mailto:anrivel@gmail.com&subject=Employment%20Offer"
        case .cenadores: return "https://cenadorespr.org/how-we-work"
        }
    }
}
