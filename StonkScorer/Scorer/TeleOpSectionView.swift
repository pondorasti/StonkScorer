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

            StepperView(
                bindingProperty: $teleOpScorer.stonesDelivered,
                image: Image(iconName: .stoneDelivered),
                title: "Stones Delivered"
            )

            StepperView(
                bindingProperty: $teleOpScorer.stonesPlaced,
                image: Image(iconName: .stonePlaced),
                title: "Stones Placed"
            )

            StepperView(
                bindingProperty: $teleOpScorer.skyscraperHeight,
                image: Image(iconName: .skyscraper),
                title: "Skyscraper Height"
            )

            HStack() {
                Image(systemName: "t.circle.fill")
                    .font(.headline)
                    .frame(minWidth: Constants.iconMinWidth)

                Text("Total Points")

                Text("\(teleOpScorer.totalPoints)")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
            }
        }
    }
}
