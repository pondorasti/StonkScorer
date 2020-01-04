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

            ToggleView(
                bindingProperty: $autoScorer.foundationRepositioned,
                image: Image(iconName: .foundation),
                title: "Repositioning (\(ScoringGuidelines.Auto.repositioning))"
            )

            PickerView(
                bindingProperty: $autoScorer.numberOfSkystoneBonuses,
                image: Image(iconName: .skystone),
                title: "Skystone Bonus (\(ScoringGuidelines.Auto.skystoneBonus))",
                options: ScoringGuidelines.Auto.skystoneBonusOptions
            )

            StepperView(
                bindingProperty: $autoScorer.stonesDelivered,
                image: Image(iconName: .stoneDelivered),
                title: "Stones Delivered (\(ScoringGuidelines.Auto.stoneDelivered))",
                stepperRange: 0...6
            )

            StepperView(
                bindingProperty: $autoScorer.stonesPlaced,
                image: Image(iconName: .stonePlaced),
                title: "Stones Placed (\(ScoringGuidelines.Auto.stonePlaced))",
                stepperRange: 0...6
            )

            PickerView(
                bindingProperty: $autoScorer.numberOfNavigations,
                image: Image(systemName: "p.circle.fill"),
                title: "Navigating (\(ScoringGuidelines.Auto.navigating))",
                options: ScoringGuidelines.Auto.navigatingOptions
            )

            TotalPointsView(
                scorer: $autoScorer,
                image: Image(systemName: "a.circle.fill"),
                title: "Total Points"
            )
        }
    }
}
