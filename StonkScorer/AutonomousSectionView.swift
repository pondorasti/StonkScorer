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
            Toggle(isOn: $autoScorer.foundationRepositioned) {
                HStack {
                    Image(decorative: "Foundation")
                        .foregroundColor(autoScorer.foundationRepositioned ? Color(UIColor.systemBlue) : Color(UIColor.systemGray2))
                        .frame(minWidth: Constants.iconMinWidth)

                    Text("Repositioning")
                }
            }

            HStack(spacing: 56) {
                Text("Skystone Bonus")

                Picker(selection: $autoScorer.numberOfSkystoneBonuses, label: Text("Skystone Bonus")) {
                    ForEach(0 ..< ScoringGuidelines.Auto.skystoneBonusOptions.count) {
                        Text("\(ScoringGuidelines.Auto.skystoneBonusOptions[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }


            StepperView(
                bindingProperty: $autoScorer.stonesDelivered,
                icons: [Icon(name: .stone)],
                title: "Stones Delivered",
                stepperRange: 0...6
            )

            StepperView(
                bindingProperty: $autoScorer.stonesPlaced,
                icons: [Icon(name: .miniFoundation), Icon(name: .stone)],
                title: "Stones Placed",
                stepperRange: 0...6
            )

            HStack {
                Image(systemName: "p.circle.fill")
                    .font(.headline)
                    .frame(minWidth: Constants.iconMinWidth)

                Text("Navigating")

                Picker(selection: $autoScorer.numberOfNavigations, label: Text("Navigating")) {
                    ForEach(0 ..< ScoringGuidelines.Auto.navigatingOptions.count) {
                        Text(ScoringGuidelines.Auto.navigatingOptions[$0])
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }

            HStack() {
                Image(systemName: "a.circle.fill")
                    .font(.headline)
                    .frame(minWidth: Constants.iconMinWidth)

                Text("Total Points")

                Text("\(autoScorer.totalPoints)")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
            }

//            TotalPointsView(points: $autoScorer)
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
