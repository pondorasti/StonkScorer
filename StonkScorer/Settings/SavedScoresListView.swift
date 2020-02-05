//
//  SavedScoresListView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 05/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct SavedScoresListView: View {
    @FetchRequest(entity: SkystoneScore.entity(), sortDescriptors: []) var scores: FetchedResults<SkystoneScore>

    var body: some View {
        List {
            ForEach(scores, id: \.self) { score in
                NavigationLink(destination: SavedScoreView(savedScore: score)) {
                    Text("\(score.matchNumber!)")
                }
            }
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        .navigationBarTitle("Saved Scores")
    }
}

struct SavedScoresView_Previews: PreviewProvider {
    static var previews: some View {
        SavedScoresListView()
    }
}
// question closure parameter as Binding value
