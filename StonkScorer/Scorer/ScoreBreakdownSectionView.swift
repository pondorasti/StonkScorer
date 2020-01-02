//
//  ScoreBreakdownSectionView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 01/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct ScoreBreakdownSectionView: View {
    @Binding var scorer: Scorer



    var body: some View {
        Section(header: Text("Score Breakdown").font(.headline)) {

            TotalPointsView(
                scorer: $scorer.auto,
                image: Image(systemName: "a.circle.fill"),
                imageColor: Color(.systemGreen),
                title: "Autonomous"
            )

            TotalPointsView(
                scorer: $scorer.teleOp,
                image: Image(systemName: "t.circle.fill"),
                imageColor: Color(.systemIndigo),
                title: "TeleOp"
            )

            TotalPointsView(
                scorer: $scorer.endGame,
                image: Image(systemName: "e.circle.fill"),
                imageColor: Color(.systemOrange),
                title: "End Game"
            )

            TotalPointsView(
                scorer: $scorer,
                image: Image(systemName: "t.circle.fill"),
                title: "Total Points"
            )
        }
    }
}
