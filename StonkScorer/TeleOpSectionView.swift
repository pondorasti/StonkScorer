//
//  TeleOpSectionView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 31/12/2019.
//  Copyright © 2019 CodingBytes. All rights reserved.
//

import SwiftUI

struct TeleOpSectionView: View {

    @State private var stonesDelivered = 0
    @State private var stonesPlaced = 0
    @State private var skyscraperHeight = 0

    var totalTeleOpPoints: Int {
        var total = 0

        return total
    }

    var body: some View {
        Section(header: Text("TeleOp").font(.headline)) {
            Stepper("Stones Delivered: \(stonesDelivered)",
                value: $stonesDelivered,
                in: 0...60
            )

            StonesPlacedView(stonesPlaced: $stonesPlaced)

            Stepper("Skyscraper Height: \(skyscraperHeight)",
                value: $skyscraperHeight,
                in: 0...60
            )

            HStack() {
                Text("Total Pts")
                Text("\(totalTeleOpPoints)")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
            }
        }
    }
}

struct TeleOpSectionView_Previews: PreviewProvider {
    static var previews: some View {
        TeleOpSectionView()
    }
}
