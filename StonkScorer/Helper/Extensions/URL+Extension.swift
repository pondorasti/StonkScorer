//
//  URL.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 04/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import Foundation
import UIKit

extension URL {
    enum appLinks: String {
        case appStore = "itms-apps://itunes.apple.com/app/id1493387167"
        case rateApp = "itms-apps://itunes.apple.com/app/id1493387167?action=write-review"

        case twitter = "https://twitter.com/Pondorasti"
        case privacyPolicy = "https://docs.google.com/document/d/1Pf2aK4PXcrWsGKXQau_ivqZhgamcuvLsd9jmFtxyN44/edit?usp=sharing"

        case quantumRobotics = "https://qrobotics.eu"
        case darkNoise = "itms-apps://itunes.apple.com/app/id1465439395"
        case applePrivacyPolicy = "https://www.apple.com/uk/legal/privacy/en-ww/"
        
    }

    init?(link: appLinks) {
        self.init(string: link.rawValue)
    }

    static func open(link: appLinks) {
        if let url = URL(link: link),
            UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:])
        }
    }
}
