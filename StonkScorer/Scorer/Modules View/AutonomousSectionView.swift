//
//  AutonomousSectionView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 31/12/2019.
//  Copyright © 2019 CodingBytes. All rights reserved.
//

import SwiftUI

struct AutonomousSectionView: View {

    @Binding var autoScorer: Scorer.Auto

    var body: some View {
        Section(header: Text("Autonomous").font(.headline)) {

            ScorerToggleView(
                bindingProperty: $autoScorer.foundationRepositioned,
                image: Image(iconName: .foundation),
                title: "Repositioning"
            )

            ScorerPickerView(
                bindingProperty: $autoScorer.numberOfSkystoneBonuses,
                image: Image(iconName: .skystone),
                title: "Skystone Bonus",
                options: ScoringGuidelines.Auto.skystoneBonusOptions
            )

            ScorerStepperView(
                bindingProperty: $autoScorer.stonesDelivered,
                image: Image(iconName: .stoneDelivered),
                title: "Stones Delivered",
                stepperRange: 0...6
            )

            ScorerStepperView(
                bindingProperty: $autoScorer.stonesPlaced,
                image: Image(iconName: .stonePlaced),
                title: "Stones Placed",
                stepperRange: 0...6
            )

            ScorerPickerView(
                bindingProperty: $autoScorer.numberOfNavigations,
                image: Image(systemName: "n.circle.fill"),
                title: "Navigating",
                options: ScoringGuidelines.Auto.navigatingOptions
            )

            ScorerTotalPointsView(
                scorer: $autoScorer,
                image: Image(systemName: "a.circle.fill"),
                title: "Total Points"
            )
        }
    }
}
