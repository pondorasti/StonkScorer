//
//  ScorerView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 02/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct ScorerView: View {
    var splashScreenVersion: SplashScreen.Version?
    @State var showingNewUserView: Bool

    var showingMatchInfo: Bool {
        if UserDefaults.Keys.retrieveObject(for: .showingNewUserView) as? Bool == true {
            return true
        } else {
            return false
        }
    }

    @State private var actualShouldShowSettings = false

    @State private var scorer = Scorer()
    @State private var matchInfo = MatchInfo()

    @State private var showingSaveAlert = false

    var body: some View {
        let shouldShowSettings = Binding(
            get: { self.actualShouldShowSettings },
            set: {
                self.actualShouldShowSettings = $0
                if !$0 {
                    self.updateScorerAssist()
                }
            }
        )

        return NavigationView {
            List {
                ScorerGroup(matchInfo: $matchInfo, scorer: $scorer)

                //MARK: - Save Button
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
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarTitle("Scorer")
            .shouldDismissKeyboard()
            .sheet(isPresented: $showingNewUserView) {
                //TODO: find a better way to handle versions of SplashScreen
                //nil coalesing doesn't look alright
                SplashScreenView(isPresented: self.$showingNewUserView,
                                 splashScreenInfo: SplashScreen.Information(version: self.splashScreenVersion ?? .welcomeScreen))
            }
            .navigationBarItems(leading:

                //Show Settings Button
                Button(action: {
                    shouldShowSettings.wrappedValue.toggle()
                }, label: {
                    Image(systemName: "gear")
                        .navigationBarStyle()
                }).sheet(isPresented: shouldShowSettings, content: {
                    SettingsView(isPresented: shouldShowSettings)

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
        .onAppear { //Note: this methods gets called only one, when the view is created and appears
            self.updateScorerAssist()
        }
    }

    private func updateScorerAssist() {
        if let shouldAssistScoring = UserDefaults.Keys.retrieveObject(for: .shouldAssistScoring) as? Bool {
            self.scorer.shouldAssistScoring = shouldAssistScoring
        }
    }
}
