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
    private static let iOSID = "id1493387167"
    private static let macOSID = "id1496183214"


    enum appLinks: String {
        #if os(macOS)
        case appStore = "itms-apps://itunes.apple.com/app/id1496183214"
        case rateApp = "itms-apps://itunes.apple.com/app/id1496183214?action=write-review"
        #endif

        #if os(iOS)
        case appStore = "itms-apps://itunes.apple.com/app/id1493387167"
        case rateApp = "itms-apps://itunes.apple.com/app/id1493387167?action=write-review"
        #endif

        case twitter = "https://twitter.com/Pondorasti"
        case privacyPolicy = "https://docs.google.com/document/d/1Pf2aK4PXcrWsGKXQau_ivqZhgamcuvLsd9jmFtxyN44/edit?usp=sharing"

        
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
