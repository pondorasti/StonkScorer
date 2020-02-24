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

            //Decrease stonesPlaced based on stonesDelivered
            if oldValue.stonesDelivered > auto.stonesDelivered,
                auto.stonesPlaced != 0 {
                    auto.stonesPlaced -= 1
            }

            //Increase/Decrease stonesDelivered & TeleOp stonesPlaced based on stonesPlaced
            if oldValue.stonesPlaced < auto.stonesPlaced {
                if auto.stonesDelivered < 6 {
                    auto.stonesDelivered += 1
                }
                teleOp.stonesPlaced += 1
            } else if oldValue.stonesPlaced > auto.stonesPlaced,
                teleOp.stonesPlaced != 0 {
                teleOp.stonesPlaced -= 1
            }
        }
    }

    var teleOp = TeleOp() {
        didSet {
            guard shouldAssistScoring else {
                return
            }

            // Increase stonesDelivered based on stonesPlaced
            if oldValue.stonesPlaced < teleOp.stonesPlaced,
                teleOp.stonesPlaced != auto.stonesPlaced {
                teleOp.stonesDelivered += 1
            } else if oldValue.stonesPlaced > teleOp.stonesPlaced,
                teleOp.skyscraperHeight > teleOp.stonesPlaced,
                teleOp.skyscraperHeight != 0 {
                teleOp.skyscraperHeight -= 1
            }

            // Increase stonesDelivered & stonesPlaced based on skyscraperHeight
            if oldValue.skyscraperHeight < teleOp.skyscraperHeight {
                teleOp.stonesDelivered += 1
                teleOp.stonesPlaced += 1
            }
        }
    }

    var endGame = EndGame() {
        didSet {
            guard shouldAssistScoring else {
                return
            }

            //For disabling capstoneLevel depending on capstoneBonuses and autofilling capstone levels based on TeleOp skyscraperHeight
            if oldValue.capstoneBonuses != endGame.capstoneBonuses {
                if endGame.capstoneBonuses == 0 {
                    endGame.firstCapstoneLevel = 0
                    endGame.secondCapstoneLevel = 0
                } else if endGame.capstoneBonuses == 1 {
                    endGame.firstCapstoneLevel = teleOp.skyscraperHeight
                    endGame.secondCapstoneLevel = 0
                } else if endGame.capstoneBonuses == 2 {
                    endGame.secondCapstoneLevel = teleOp.skyscraperHeight
                }
            }
        }
    }

    var totalPoints: Int {
        var total = 0
        total += auto.totalPoints
        total += teleOp.totalPoints
        total += endGame.totalPoints

        return total
    }

    //MARK: - Auto
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

    //MARK: - TeleOp
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

    //MARK: - EndGame
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
        let shouldAssistScoring = self.shouldAssistScoring
        self = Scorer()
        self.shouldAssistScoring = shouldAssistScoring
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

//MARK: - TotalPoints Protocol
protocol TotalPoints {
    var totalPoints: Int { get }
}
