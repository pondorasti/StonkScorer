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
    @State var showingNewUserView: Bool

    @State private var shouldShowSettings = false
    @State private var scorer = Scorer()
    @State private var matchInfo = MatchInfo()

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Match Info").font(.headline)) {

                    AlliancePickerView(allianceColor: $matchInfo.allianceColor)

                    ScorerTextFieldView(
                        bindingValue: $matchInfo.teamNumber,
                        image: Image(systemName: "t.circle.fill"),
                        title: "Team Number",
                        placeholder: "14270"
                    ).keyboardType(.numberPad)

                    ScorerTextFieldView(
                        bindingValue: $matchInfo.matchNumber,
                        image: Image(systemName: "m.circle.fill"),
                        title: "Match Number",
                        placeholder: "12"
                    ).keyboardType(.numberPad)

                    TextField("Comments", text: $matchInfo.comments)
                }

                ScorerView(scorer: $scorer)

                Section {
                    Button(action: {
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
                }
                .foregroundColor(.white)
                .listRowBackground(Color(UIColor.systemGreen))
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
