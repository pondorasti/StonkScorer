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
    @State var showingNewUserView: Bool
    @State private var shouldShowSettings = false

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
            .sheet(isPresented: $showingNewUserView) {
                SplashScreenView(isPresented: self.$showingNewUserView)
            }
            .navigationBarTitle("Scorer")
            .navigationBarItems(leading:

                Button(action: {
                    self.shouldShowSettings.toggle()
                }, label: {
                    Image(systemName: "gear")
                        .navigationBarStyle()
                })
                .sheet(isPresented: $shouldShowSettings, content: {
                    SettingsView(isPresented: self.$shouldShowSettings)
                })

                , trailing:

                Button(action: {
                    self.scorer = Scorer() //TODO: add a reset function, this is the lazy way
                }, label: {
                    Image(systemName: "gobackward")
                        .navigationBarStyle()
                })
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(showingNewUserView: false)
    }
}
