//
//  SavedScoresView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 05/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct SavedScoresView: View {
    @FetchRequest(entity: SkystoneScore.entity(), sortDescriptors: []) var scores: FetchedResults<SkystoneScore>

    var body: some View {
        List {
            ForEach(scores, id: \.self) { score in
//                let scorer = Scorer()

                NavigationLink(destination: ScorerView(matchInfo: .constant(MatchInfo()), scorer: .constant(Scorer(from: score))).navigationBarTitle("Score")) {


                    Text("\(score.matchNumber!)")

                }
            }
        }
        .navigationBarTitle("Saved Scores")
    }
}

struct SavedScoresView_Previews: PreviewProvider {
    static var previews: some View {
        SavedScoresView()
    }
}
