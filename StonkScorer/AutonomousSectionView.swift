//
//  AutonomousSectionView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 31/12/2019.
//  Copyright © 2019 CodingBytes. All rights reserved.
//

import SwiftUI

struct AutonomousSectionView: View {

    @State private var autoScorer = Scorer.Auto(
        foundationRepositioned: false,
        numberOfSkystoneBonuses: 0,
        stonesDelivered: 0,
        stonesPlaced: 0,
        numberOfNavigations: 0
    )

    var body: some View {
        Section(header: Text("Autonomous").font(.headline)) {

            ToggleView(
                bindingProperty: $autoScorer.foundationRepositioned,
                image: Image(iconName: .foundation),
                title: "Repositioning"
            )

            PickerView(
                bindingProperty: $autoScorer.numberOfSkystoneBonuses,
                image: Image(iconName: .skystone),
                title: "Skystone Bonus",
                options: ScoringGuidelines.Auto.skystoneBonusOptions
            )

            StepperView(
                bindingProperty: $autoScorer.stonesDelivered,
                image: Image(iconName: .stoneDelivered),
                title: "Stones Delivered",
                stepperRange: 0...6
            )

            StepperView(
                bindingProperty: $autoScorer.stonesPlaced,
                image: Image(iconName: .stonePlaced),
                title: "Stones Placed",
                stepperRange: 0...6
            )

            PickerView(
                bindingProperty: $autoScorer.numberOfNavigations,
                image: Image(systemName: "p.circle.fill"),
                title: "Navigating",
                options: ScoringGuidelines.Auto.navigatingOptions
            )

            HStack() {
                Image(systemName: "a.circle.fill")
                    .font(.headline)
                    .frame(minWidth: Constants.iconMinWidth)

                Text("Total Points")

                Text("\(autoScorer.totalPoints)")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
            }
        }
    }
}

struct AutonomousSectionView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            AutonomousSectionView()
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
    }
}
