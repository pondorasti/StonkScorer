//
//  Scorer.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 31/12/2019.
//  Copyright © 2019 CodingBytes. All rights reserved.
//

import Foundation

struct Scorer {
    struct Auto: TotalPoints {
        var foundationRepositioned: Bool
        var numberOfSkystoneBonuses: Int
        var stonesDelivered: Int
        var stonesPlaced: Int
        var numberOfNavigations: Int

        var totalPoints: Int {
            var total = 0

            total += (foundationRepositioned ? ScoringGuidelines.Auto.repositioning : 0)
            total += numberOfSkystoneBonuses * ScoringGuidelines.Auto.skystoneBonus
            total += stonesDelivered * ScoringGuidelines.Auto.stoneDelivered
            total += stonesPlaced * ScoringGuidelines.Auto.stonePlaced
            total += numberOfNavigations * ScoringGuidelines.Auto.navigating

            return total
        }
    }

    struct TeleOp: TotalPoints {
        var stonesDelivered: Int
        var stonesPlaced: Int
        var skyscraperHeight: Int

        var totalPoints: Int {
            var total = 0

            total += stonesDelivered * ScoringGuidelines.TeleOp.stoneDelivered
            total += stonesPlaced * ScoringGuidelines.TeleOp.stonePlaced
            total += skyscraperHeight * ScoringGuidelines.TeleOp.skyscraperBonus

            return total
        }
    }

    struct EndgGame: TotalPoints {
        var capstoneBonuses: Int
        var firstCapstoneLevel: Int
        var secondCapstoneLevel: Int
        var foundationMoved: Bool
        var numberOfParkings: Int

        var totalPoints: Int {
            var total = 0

            total += capstoneBonuses * ScoringGuidelines.EndGame.capstoneBonus
            total += firstCapstoneLevel * ScoringGuidelines.EndGame.capstoneLevel
            total += secondCapstoneLevel * ScoringGuidelines.EndGame.capstoneLevel
            total += (foundationMoved ? ScoringGuidelines.EndGame.foundationMoved : 0)
            total += numberOfParkings * ScoringGuidelines.EndGame.parking

            return total
        }
    }
}

protocol TotalPoints {
    var totalPoints: Int { get }
}
