//
//  ContentView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 31/12/2019.
//  Copyright © 2019 CodingBytes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var scorer = Scorer()

    var body: some View {
        NavigationView {
            List {
                AutonomousSectionView(autoScorer: $scorer.auto)
                TeleOpSectionView(teleOpScorer: $scorer.teleOp)
                EndGameSectionView(endGameScorer: $scorer.endGame)
                ScoreBreakdownSectionView(scorer: $scorer)
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .navigationBarTitle("Scorer")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
