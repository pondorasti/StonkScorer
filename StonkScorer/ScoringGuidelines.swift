//
//  ScoringGuidelines.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 31/12/2019.
//  Copyright © 2019 CodingBytes. All rights reserved.
//

import Foundation

struct ScoringGuidelines {
    struct Auto {
        static let repositioning = 10
        static let skystoneBonus = 8
        static let stoneDelivered = 2
        static let stonePlaced = 4
        static let navigating = 5

        static let skystoneBonusOptions = [0, 1, 2]
        static let navigatingOptions = ["None", "One", "Both"]
    }

    struct TeleOp {
        static let stoneDelivered = 1
        static let stonePlaced = 1
        static let skyscraperBonus = 2
    }
}
