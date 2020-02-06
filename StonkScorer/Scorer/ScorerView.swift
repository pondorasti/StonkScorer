//
//  ScorerView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 02/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct ScorerView: View {
    @State var showingNewUserView: Bool
    var showingMatchInfo: Bool {
        if UserDefaults.Keys.retrieveObject(for: .showingNewUserView) as? Bool == true {
            return true
        } else {
            return false
        }
    }

    @State private var shouldShowSettings = false

    @State private var scorer = Scorer()
    @State private var matchInfo = MatchInfo()

    @State private var showingSaveAlert = false

    var body: some View {
        NavigationView {
            List {
                ScorerGroup(matchInfo: $matchInfo, scorer: $scorer)

                // Save Button
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
                                dismissButton: .default(Text("Done!"), action: {
                                    self.matchInfo.reset()
                                    self.scorer.reset()
                                })
                            )
                    }
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

                //Show Settings Button
                Button(action: {
                    self.shouldShowSettings.toggle()
                }, label: {
                    Image(systemName: "gear")
                        .navigationBarStyle()
                }).sheet(isPresented: $shouldShowSettings, content: {
                    SettingsView(isPresented: self.$shouldShowSettings)

                }), trailing:

                // Reset Scorer Button
                Button(action: {
                    self.matchInfo.reset()
                    self.scorer.reset()
                }, label: {
                    Image(systemName: "gobackward")
                        .navigationBarStyle()
                })
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
//TODO: reset MatchInfo
