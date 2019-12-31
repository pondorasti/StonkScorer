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
                    Image("Foundation")
                        .foregroundColor(autoScorer.foundationRepositioned ? Color(UIColor.systemBlue) : Color(UIColor.systemGray2))
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

            StonesDeliveredView(stonesDelivered: $autoScorer.stonesDelivered)
            StonesPlacedView(stonesPlaced: $autoScorer.stonesPlaced)

            HStack {
                Image(systemName: "p.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 24)
                Text("Navigating")
                Picker(selection: $autoScorer.numberOfNavigations, label: Text("Navigating")) {
                    ForEach(0 ..< ScoringGuidelines.Auto.navigatingOptions.count) {
                        Text(ScoringGuidelines.Auto.navigatingOptions[$0])
                    }
                }.pickerStyle(SegmentedPickerStyle())
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
