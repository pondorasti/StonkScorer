//
//  TeleOpSectionView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 31/12/2019.
//  Copyright © 2019 CodingBytes. All rights reserved.
//

import SwiftUI

struct TeleOpSectionView: View {
    @Binding var teleOpScorer: Scorer.TeleOp
    
    var body: some View {
        Section(header: Text("TeleOp").font(.headline)) {

            ScorerStepperView(
                bindingProperty: $teleOpScorer.stonesDelivered,
                image: Image(iconName: .stoneDelivered),
                title: "Stones Delivered"
            )

            ScorerStepperView(
                bindingProperty: $teleOpScorer.stonesPlaced,
                image: Image(iconName: .stonePlaced),
                title: "Stones Placed"
            )

            ScorerStepperView(
                bindingProperty: $teleOpScorer.skyscraperHeight,
                image: Image(iconName: .skyscraper),
                title: "Skyscraper Height"
            )

            ScorerTotalPointsView(
                scorer: $teleOpScorer,
                image: Image(systemName: "t.circle.fill"),
                title: "Total Points"
            )
        }
    }
}
