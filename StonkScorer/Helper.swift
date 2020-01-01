//
//  Helper.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 01/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import Foundation
import CoreGraphics
import SwiftUI

struct Constants {
    static let iconMinWidth: CGFloat = 36
}

extension Image {
    enum IconNames: String {
        case skystone
        case stonePlaced
        case skyscraper
        case stoneDelivered
        case stone
        case foundation
        
    }

    init(iconName: IconNames) {
        self.init(decorative: iconName.rawValue)
    }
}
