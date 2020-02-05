//
//  ScorerView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 02/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct ScorerView: View {
    @Binding var matchInfo: MatchInfo
    @Binding var scorer: Scorer

    @State private var showingSaveAlert = false

    var body: some View {
        List {
            MatchInfoView(matchInfo: $matchInfo)
            AutonomousSectionView(autoScorer: $scorer.auto)
            TeleOpSectionView(teleOpScorer: $scorer.teleOp)
            EndGameSectionView(endGameScorer: $scorer.endGame)
            ScoreBreakdownSectionView(scorer: $scorer)

            // save button
            Section {
                Button(action: {
                    let _ = SkystoneScore(from: self.scorer, with: self.matchInfo)
                    self.showingSaveAlert.toggle()
                }, label: {
                    HStack {
                        Image(systemName: "arrow.down.circle.fill")
                            .iconModifier()
                        Text("Save Score")
                            .bold()
                        Spacer()
                    }
                })
                .buttonStyle(BorderlessButtonStyle())
                .alert(isPresented: $showingSaveAlert) {
                    Alert(title: Text("Data saved!"),// TODO: better text
                        message: Text("Go to settings to see all the saved scores"),
                        dismissButton: .default(Text("Done"))
                )
                }
            }
            .foregroundColor(.white)
            .listRowBackground(Color(UIColor.systemGreen))
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
    }
}

