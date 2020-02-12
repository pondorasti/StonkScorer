//
//  SkystoneScoreExtension.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 05/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import Foundation
import CoreData

extension SkystoneScore {
    convenience init(from scorer: Scorer,
                     with matchInfo: MatchInfo,
                     shouldSave: Bool = true,
                     context: NSManagedObjectContext = SkystoneScore.persistentContainer.viewContext) {

        self.init(context: context)

        id = UUID()

        allianceColor = Int16(matchInfo.allianceColor)
        teamNumber = matchInfo.teamNumber
        matchNumber = matchInfo.matchNumber
        comments = matchInfo.comments

        foundationRepositioned = scorer.auto.foundationRepositioned
        numberOfSkystoneBonuses = Int16(scorer.auto.numberOfSkystoneBonuses)
        autoStonesDelivered = Int16(scorer.auto.stonesDelivered)
        autoStonesPlaced = Int16(scorer.auto.stonesPlaced)
        numberOfNavigations = Int16(scorer.auto.numberOfNavigations)

        teleOpStonesDelivered = Int16(scorer.teleOp.stonesDelivered)
        teleOpStonesPlaced = Int16(scorer.teleOp.stonesPlaced)
        skyscraperHeight = Int16(scorer.teleOp.skyscraperHeight)

        capstoneBonuses = Int16(scorer.endGame.capstoneBonuses)
        firstCapstoneLevel = Int16(scorer.endGame.firstCapstoneLevel)
        secondCapstoneLevel = Int16(scorer.endGame.secondCapstoneLevel)
        foundationMoved = scorer.endGame.foundationMoved
        numberOfParkings = Int16(scorer.endGame.numberOfParkings)

        if shouldSave {
            SkystoneScore.conditionalSave(in: context)
        }
    }

    func update(matchInfo: MatchInfo? = nil, scorer: Scorer? = nil, in context: NSManagedObjectContext = SkystoneScore.persistentContainer.viewContext) {
        if let matchInfo = matchInfo {
            allianceColor = Int16(matchInfo.allianceColor)
            teamNumber = matchInfo.teamNumber
            matchNumber = matchInfo.matchNumber
            comments = matchInfo.comments
        }

        if let scorer = scorer {
            foundationRepositioned = scorer.auto.foundationRepositioned
            numberOfSkystoneBonuses = Int16(scorer.auto.numberOfSkystoneBonuses)
            autoStonesDelivered = Int16(scorer.auto.stonesDelivered)
            autoStonesPlaced = Int16(scorer.auto.stonesPlaced)
            numberOfNavigations = Int16(scorer.auto.numberOfNavigations)

            teleOpStonesDelivered = Int16(scorer.teleOp.stonesDelivered)
            teleOpStonesPlaced = Int16(scorer.teleOp.stonesPlaced)
            skyscraperHeight = Int16(scorer.teleOp.skyscraperHeight)

            capstoneBonuses = Int16(scorer.endGame.capstoneBonuses)
            firstCapstoneLevel = Int16(scorer.endGame.firstCapstoneLevel)
            secondCapstoneLevel = Int16(scorer.endGame.secondCapstoneLevel)
            foundationMoved = scorer.endGame.foundationMoved
            numberOfParkings = Int16(scorer.endGame.numberOfParkings)
        }

        SkystoneScore.conditionalSave(in: context)
    }

    //Developer's Notes - Just a note to my future self

    //An alternative to extending SkystoneScore Entity would be to create some sort of CoreDataHelper object
    //The only downside of this solution is that the CoreData related functions are locked down to be used only with this entity even though the functions are quite universal and reusable from certain points of view
    //Conclusion - I will bother with a better implementation when I will have multiple Entities or Data Models

    // MARK: - Core Data Delete

    func delete(in context: NSManagedObjectContext = SkystoneScore.persistentContainer.viewContext) {
        context.delete(self)
        SkystoneScore.conditionalSave(in: context)
    }

    // MARK: - Core Data Saving support
    static func conditionalSave(in context: NSManagedObjectContext = SkystoneScore.persistentContainer.viewContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                //TODO: Error Handling
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    // MARK: - Core Data stack
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Scorer")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                //TODO: Error Handling

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}
