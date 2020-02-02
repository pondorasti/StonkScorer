//
//  ContentView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 31/12/2019.
//  Copyright © 2019 CodingBytes. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @State private var scorer = Scorer()
    @State private var shouldShowSettings = false

    @State var showingNewUserView: Bool

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
                HStack {
                    Button(action: {
                        self.scorer = Scorer() //TODO: add a reset function, this is the lazy way
                    }, label: {
                        Image(systemName: "gobackward")
                            .navigationBarStyle()
                    })

                    Button(action: {

                    }, label: {
                        Image(systemName: "square.and.arrow.down")
                            .navigationBarStyle()
                    })
                }
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

extension SkystoneScore {
    convenience init(scorer: Scorer, inContext context: NSManagedObjectContext) {
        self.init(context: context)

        foundationRepositioned = scorer.auto.foundationRepositioned
        numberOfSkystoneBonuses = Int16(scorer.auto.numberOfSkystoneBonuses)
        autoStonesDelivered = Int16(scorer.auto.stonesDelivered)
        autoStonesPlaced = Int16(scorer.auto.stonesPlaced)
        numberOfNavigations = Int16(scorer.auto.numberOfNavigations)

        teleOpStonesDelivered = Int16(scorer.teleOp.stonesDelivered)
        teleOpStonesPlaced = Int16(scorer.teleOp.stonesPlaced)
        skyscraperHeight = Int16(scorer.teleOp.skyscraperHeight)

        capstoneBonuses = Int16(scorer.endGame.capstoneBonuses)
        firstCapstoneLevel = Int16(scorer.endGame.firstCapstoneLevel)
        secondCapstoneLevel = Int16(scorer.endGame.secondCapstoneLevel)
        foundationMoved = scorer.endGame.foundationMoved
        numberOfParkings = Int16(scorer.endGame.numberOfParkings)
    }
}
