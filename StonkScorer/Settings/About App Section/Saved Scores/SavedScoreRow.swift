//
//  SavedScoreRow.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 07/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct SavedScoreRow: View {
    @ObservedObject var score: SkystoneScore

    var body: some View {
        let matchInfo = State(initialValue: MatchInfo(from: self.score))
        let scorer = State(initialValue: Scorer(from: self.score))

        return HStack {
            VStack(alignment: .leading) {
                Text("Team \(matchInfo.wrappedValue.teamNumber)")
                    .font(.headline)
                    .foregroundColor(.primary)
                Text("Match \(matchInfo.wrappedValue.matchNumber)")
                    .font(.body)
                    .foregroundColor(.secondary)
            }

            Text("\(scorer.wrappedValue.totalPoints)")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.all, 8)
                .background(
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: (matchInfo.wrappedValue.allianceColor == 0 ? geometry.size.height / 2 : 6))
                            .foregroundColor(matchInfo.wrappedValue.allianceColor == 0 ? Color(UIColor.systemBlue) : Color(UIColor.systemRed))
                            .frame(width: geometry.size.height, height: geometry.size.height)
                    })
                .frame(minWidth: 48) // *facepalm* ... TODO: look for better solution to center this view
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
        }
    }
}
