//
//  SavedScoresListView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 05/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct SavedScoresListView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: SkystoneScore.entity(), sortDescriptors: []) var scores: FetchedResults<SkystoneScore>

    var body: some View {
        List {
            ForEach(scores, id: \.self) { score in
                NavigationLink(destination: SavedScoreDetailView(score: score).environment(\.managedObjectContext, self.moc)) {
                    SavedScoreRow(score: score)
                }
            }
        .onDelete(perform: deleteScores)
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        .navigationBarTitle("Saved Scores")
    }

    func deleteScores(at offsets: IndexSet) {
        for offset in offsets {
            scores[offset].delete(in: moc)
        }
    }
}

struct SavedScoresView_Previews: PreviewProvider {
    static var previews: some View {
        SavedScoresListView()
    }
}
