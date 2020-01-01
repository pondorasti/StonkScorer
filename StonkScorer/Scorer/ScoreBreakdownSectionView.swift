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

            HStack() {
                Image(systemName: "a.circle.fill")
                    .font(.system(size: Constants.sfSymbolSize))
                    .foregroundColor(Color(UIColor.systemGreen))
                    .frame(minWidth: Constants.iconMinWidth)

                Text("Autonomous")

                Text("\(scorer.auto.totalPoints)")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
            }

            HStack() {
                Image(systemName: "t.circle.fill")
                    .font(.system(size: Constants.sfSymbolSize))
                    .foregroundColor(Color(UIColor.systemIndigo))
                    .frame(minWidth: Constants.iconMinWidth)

                Text("TeleOp")

                Text("\(scorer.teleOp.totalPoints)")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
            }

            HStack() {
                Image(systemName: "e.circle.fill")
                    .font(.system(size: Constants.sfSymbolSize))
                    .foregroundColor(Color(UIColor.systemPink))
                    .frame(minWidth: Constants.iconMinWidth)

                Text("End Game")

                Text("\(scorer.endGame.totalPoints)")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
            }

            HStack() {
                Image(systemName: "e.circle.fill")
                    .font(.system(size: Constants.sfSymbolSize))
                    .frame(minWidth: Constants.iconMinWidth)

                Text("Total Points")

                Text("\(scorer.auto.totalPoints + scorer.teleOp.totalPoints + scorer.endGame.totalPoints)")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
            }
        }
    }
}
