//
//  ScorerGroup.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 05/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct ScorerGroup: View {
    @Binding var matchInfo: MatchInfo
    @Binding var scorer: Scorer

    var body: some View {
        Group {
            MatchInfoView(matchInfo: $matchInfo)
            AutonomousSectionView(autoScorer: $scorer.auto)
            TeleOpSectionView(teleOpScorer: $scorer.teleOp)
            EndGameSectionView(endGameScorer: $scorer.endGame)
            ScoreBreakdownSectionView(scorer: $scorer)
        }
    }
}
