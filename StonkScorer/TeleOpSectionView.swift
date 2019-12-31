//
//  TeleOpSectionView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 31/12/2019.
//  Copyright © 2019 CodingBytes. All rights reserved.
//

import SwiftUI

struct TeleOpSectionView: View {

    @State private var teleOpScorer = Scorer.TeleOp(
        stonesDelivered: 0,
        stonesPlaced: 0,
        skyscraperHeight: 0
    )

    var body: some View {
        Section(header: Text("TeleOp").font(.headline)) {
            StonesDeliveredView(stonesDelivered: $teleOpScorer.stonesDelivered)
            StonesPlacedView(stonesPlaced: $teleOpScorer.stonesPlaced)
            SkyscraperHeightView(skyscraperHeight: $teleOpScorer.skyscraperHeight)

            HStack() {
                Text("Total Points")
                Text("\(teleOpScorer.totalPoints)")
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
