//
//  EndGameSectionView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 01/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct EndGameSectionView: View {

    @State private var endGameScorer = Scorer.EndgGame(
        capstoneBonuses: 0,
        firstCapstoneLevel: 0,
        secondCapstoneLevel: 0,
        foundationMoved: false,
        numberOfParkings: 0
    )

    var body: some View {
        Section(header: Text("End Game").font(.headline)) {

            PickerView(
                bindingProperty: $endGameScorer.capstoneBonuses,
                image: Image(iconName: .skystone),
                title: "Capstone Bonus",
                options: ScoringGuidelines.EndGame.capstoneBonusOptions
            )

            StepperView(
                bindingProperty: $endGameScorer.firstCapstoneLevel,
                image: Image(iconName: .skystone),
                title: "Capstone 1 Levels"
            )

            StepperView(
                bindingProperty: $endGameScorer.secondCapstoneLevel,
                image: Image(iconName: .skystone),
                title: "Capstone 2 Levels"
            )

            PickerView(
                bindingProperty: $endGameScorer.numberOfParkings,
                image: Image(systemName: "p.circle.fill"),
                title: "Parking",
                options: ScoringGuidelines.EndGame.parkingOptions
            )

        }
    }
}

struct EndGameSectionView_Previews: PreviewProvider {
    static var previews: some View {
        EndGameSectionView()
    }
}
