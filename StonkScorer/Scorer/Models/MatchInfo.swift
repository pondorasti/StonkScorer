//
//  MatchInfo.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 02/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import Foundation

struct MatchInfo {
    var allianceColor: Int
    var teamNumber: String
    var matchNumber: String
    var comments: String

    init() {
        allianceColor = 0
        teamNumber = ""
        matchNumber = ""
        comments = ""
    }

    init(from score: SkystoneScore) {
        self.init()

        allianceColor = Int(score.allianceColor)
        teamNumber = score.teamNumber ?? ""
        matchNumber = score.matchNumber ?? ""
        comments = score.comments ?? ""
    }

    mutating func reset() {
        self = MatchInfo()
    }
}
