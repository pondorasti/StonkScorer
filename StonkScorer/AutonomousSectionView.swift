//
//  AutonomousSectionView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 31/12/2019.
//  Copyright © 2019 CodingBytes. All rights reserved.
//

import SwiftUI

struct AutonomousSectionView: View {
    @State private var foundationRepositioned = false
    @State private var numberOfSkystoneBonuses = 0
    @State private var stonesDelivered = 0
    @State private var stonesPlaced = 0
    @State private var numberOfNavigations = 0

    var totalAutonomousPoints: Int {
        var total = 0
        total += (foundationRepositioned ? ScoringGuidelines.Auto.repositioning : 0)
        total += numberOfSkystoneBonuses * ScoringGuidelines.Auto.skystoneBonus
        total += stonesDelivered * ScoringGuidelines.Auto.stoneDelivered
        total += stonesPlaced * ScoringGuidelines.Auto.stonePlaced
        total += numberOfNavigations * ScoringGuidelines.Auto.navigating

        return total
    }

    var body: some View {
        Section(header: Text("Autonomous").font(.headline)) {
            Toggle(isOn: $foundationRepositioned) {
                HStack {
                    Image("FoundationV2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 24) //TODO: fix icon
                        .foregroundColor(foundationRepositioned ? Color(UIColor.systemBlue) : Color(UIColor.systemGray))
                    Text("Repositioning")
                }
            }

            HStack(spacing: 56) {
                Text("Skystone Bonus")
                Picker(selection: $numberOfSkystoneBonuses, label: Text("Skystone Bonus")) {
                    ForEach(0 ..< ScoringGuidelines.Auto.skystoneBonusOptions.count) {
                        Text("\(ScoringGuidelines.Auto.skystoneBonusOptions[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }

            Stepper("Stones Delivered: \(stonesDelivered)",
                value: $stonesDelivered,
                in: 0...6
            )


            StonesPlacedView(stonesPlaced: $stonesPlaced)

            HStack {
                Image(systemName: "p.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 24)
                Text("Navigating")
                Picker(selection: $numberOfNavigations, label: Text("Navigating")) {
                    ForEach(0 ..< ScoringGuidelines.Auto.navigatingOptions.count) {
                        Text(ScoringGuidelines.Auto.navigatingOptions[$0])
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }

            HStack() {
                Text("Total Pts")
                Text("\(totalAutonomousPoints)")
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
