//
//  EndGameSectionView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 01/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct EndGameSectionView: View {

    @Binding var endGameScorer: Scorer.EndGame

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
                title: "Capstone 1 Level"
            )

            StepperView(
                bindingProperty: $endGameScorer.secondCapstoneLevel,
                image: Image(iconName: .skystone),
                title: "Capstone 2 Level"
            )

            ToggleView(
                bindingProperty: $endGameScorer.foundationMoved,
                image: Image(iconName: .foundation),
                title: "Foundation Moved"
            )

            PickerView(
                bindingProperty: $endGameScorer.numberOfParkings,
                image: Image(systemName: "p.circle.fill"),
                title: "Parking",
                options: ScoringGuidelines.EndGame.parkingOptions
            )


            HStack() {
                Image(systemName: "e.circle.fill")
                    .font(.headline)
                    .frame(minWidth: Constants.iconMinWidth)

                Text("Total Points")

                Text("\(endGameScorer.totalPoints)")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
            }
        }
    }
}

