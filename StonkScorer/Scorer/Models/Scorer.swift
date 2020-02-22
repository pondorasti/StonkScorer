//
//  Scorer.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 31/12/2019.
//  Copyright © 2019 CodingBytes. All rights reserved.
//

import Foundation

struct Scorer: TotalPoints {
    var shouldAssistScoring = false

    var auto = Auto() {
        didSet {
            guard shouldAssistScoring else {
                return
            }

            //Auto
            if auto.stonesDelivered != oldValue.stonesDelivered,
                auto.stonesDelivered < auto.stonesPlaced {
                auto.stonesPlaced = auto.stonesDelivered
            }

            if auto.stonesPlaced != oldValue.stonesPlaced,
                auto.stonesDelivered < auto.stonesPlaced {
                auto.stonesDelivered = auto.stonesPlaced
            }

            //TeleOp
            if teleOp.stonesPlaced <= 6 && teleOp.stonesDelivered == 0 {
                teleOp.stonesPlaced = auto.stonesPlaced
            }

            //EndGame
            //For disabling capstoneLevel depending on capstoneBonuses
            if endGame.capstoneBonuses == 0 {
                endGame.firstCapstoneLevel = 0
                endGame.secondCapstoneLevel = 0
            } else if endGame.capstoneBonuses == 1 {
                endGame.secondCapstoneLevel = 0
            }
        }
    }
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

    mutating func reset() {
        self = Scorer()
    }

    init() {
        auto = Auto()
        teleOp = TeleOp()
        endGame = EndGame()
    }

    init(from score: SkystoneScore) {
        self.init()

        auto.foundationRepositioned = score.foundationRepositioned
        auto.numberOfSkystoneBonuses = Int(score.numberOfSkystoneBonuses)
        auto.stonesDelivered = Int(score.autoStonesDelivered)
        auto.stonesPlaced = Int(score.autoStonesPlaced)
        auto.numberOfNavigations = Int(score.numberOfNavigations)

        teleOp.stonesDelivered = Int(score.teleOpStonesDelivered)
        teleOp.stonesPlaced = Int(score.teleOpStonesPlaced)
        teleOp.skyscraperHeight = Int(score.skyscraperHeight)

        endGame.capstoneBonuses = Int(score.capstoneBonuses)
        endGame.firstCapstoneLevel = Int(score.firstCapstoneLevel)
        endGame.secondCapstoneLevel = Int(score.secondCapstoneLevel)
        endGame.foundationMoved = score.foundationMoved
        endGame.numberOfParkings = Int(score.numberOfParkings)
    }
}

protocol TotalPoints {
    var totalPoints: Int { get }
}
