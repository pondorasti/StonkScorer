//
//  SplashScreensListView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 23/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct SplashScreensListView: View {
    @State private var showingWelcomeScreen = false
    @State private var showingFirstUpdate = false
    
    var body: some View {
        List {
            Button(action: {
                self.showingWelcomeScreen.toggle()
            }) {
                SettingsRowView(
                    image: Image(systemName: "10.circle.fill"),
                    imageColor: Color(UIColor.systemBlue),
                    title: "Welcome - Version 1.0"
                )
                
            }
            .sheet(isPresented: $showingWelcomeScreen) {
                SplashScreenView(isPresented: self.$showingWelcomeScreen,
                                 splashScreenInfo: SplashScreen.Information(version: .welcomeScreen))
            }
            
            Button(action: {
                self.showingFirstUpdate.toggle()
            }) {
                SettingsRowView(
                    image: Image(systemName: "11.circle.fill"),
                    imageColor: Color(UIColor.systemBlue),
                    title: "Update - Version 1.1"
                )
            }
            .sheet(isPresented: $showingFirstUpdate) {
                SplashScreenView(isPresented: self.$showingFirstUpdate,
                                 splashScreenInfo: SplashScreen.Information(version: .firstUpdate))
            }
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        .navigationBarTitle("Splash Screens")
    }
}

struct SplashScreensListView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreensListView()
    }
}
