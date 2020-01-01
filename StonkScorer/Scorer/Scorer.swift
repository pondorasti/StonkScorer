//
//  Scorer.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 31/12/2019.
//  Copyright © 2019 CodingBytes. All rights reserved.
//

import Foundation

struct Scorer: TotalPoints {
    var auto = Auto()
    var teleOp = TeleOp()
    var endGame = EndGame()

    var totalPoints: Int {
        var total = 0
        total += auto.totalPoints
        total += teleOp.totalPoints
        total += endGame.totalPoints

        return total
    }
    
    struct Auto: TotalPoints {
        var foundationRepositioned: Bool = false
        var numberOfSkystoneBonuses: Int = 0
        var stonesDelivered: Int = 0
        var stonesPlaced: Int = 0
        var numberOfNavigations: Int = 0

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
        var stonesDelivered: Int = 0
        var stonesPlaced: Int = 0
        var skyscraperHeight: Int = 0

        var totalPoints: Int {
            var total = 0

            total += stonesDelivered * ScoringGuidelines.TeleOp.stoneDelivered
            total += stonesPlaced * ScoringGuidelines.TeleOp.stonePlaced
            total += skyscraperHeight * ScoringGuidelines.TeleOp.skyscraperBonus

            return total
        }
    }

    struct EndGame: TotalPoints {
        var capstoneBonuses: Int = 0
        var firstCapstoneLevel: Int = 0
        var secondCapstoneLevel: Int = 0
        var foundationMoved: Bool = false
        var numberOfParkings: Int = 0

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
