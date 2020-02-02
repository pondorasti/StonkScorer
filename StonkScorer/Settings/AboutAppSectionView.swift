//
//  AboutAppSectionView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 04/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct AboutAppSectionView: View {
    
    @Binding var isShowingSplashScreen: Bool

    var body: some View {
        Section(header: Text("About the App").font(.headline)) {

            //MARK: - Splash Screen
            Button(action: {
                self.isShowingSplashScreen.toggle()
            }) {
                SettingsRowView(
                    image: Image(systemName: "book.circle.fill"),
                    imageColor: Color(UIColor.systemIndigo),
                    title: "Splash Screen"
                )
            }
            .sheet(isPresented: $isShowingSplashScreen) {
                SplashScreenView(isPresented: self.$isShowingSplashScreen)

                
            }
        }
    }
}

struct AboutAppSectionView_Previews: PreviewProvider {
    static var previews: some View {
        AboutAppSectionView(isShowingSplashScreen: .constant(false))
    }
}
