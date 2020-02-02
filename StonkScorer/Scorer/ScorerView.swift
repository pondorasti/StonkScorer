//
//  ScorerView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 02/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct ScorerView: View {
    @Binding var scorer: Scorer
    var body: some View {
        Group {
            AutonomousSectionView(autoScorer: $scorer.auto)
            TeleOpSectionView(teleOpScorer: $scorer.teleOp)
            EndGameSectionView(endGameScorer: $scorer.endGame)
            ScoreBreakdownSectionView(scorer: $scorer)
        }
    }
}

