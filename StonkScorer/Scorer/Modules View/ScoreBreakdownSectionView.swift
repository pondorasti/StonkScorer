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

            ScorerTotalPointsView(
                scorer: $scorer.auto,
                image: Image(systemName: "a.circle.fill"),
                title: "Autonomous"
            )

            ScorerTotalPointsView(
                scorer: $scorer.teleOp,
                image: Image(systemName: "t.circle.fill"),
                title: "TeleOp"
            )

            ScorerTotalPointsView(
                scorer: $scorer.endGame,
                image: Image(systemName: "e.circle.fill"),
                title: "End Game"
            )

            ScorerTotalPointsView(
                scorer: $scorer,
                image: Image(systemName: "t.circle.fill"),
                title: "Total Points"
            )
        }
    }
}
