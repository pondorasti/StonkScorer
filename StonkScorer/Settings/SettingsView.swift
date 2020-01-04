//
//  SettingsView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 02/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct SettingsView: View {

    @Binding var isPresented: Bool
    @State var isShowingSplashScreen = false

    var body: some View {
        NavigationView {
            List {
                AboutAppSectionView(isShowingSplashScreen: $isShowingSplashScreen)
                SendFeedbackSectionView()
                AppInfoSectionView()
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .navigationBarTitle("Settings")
            .navigationBarItems(leading:
                Button(action: {
                    self.isPresented.toggle()
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: Constants.navBarIcons, height: Constants.navBarIcons, alignment: .center)
                })
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isPresented: .constant(true))
    }
}


