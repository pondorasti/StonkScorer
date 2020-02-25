//
//  SettingsListView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 02/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct SettingsListView: View {
    @Binding var isPresented: Bool
    @State var isShowingSplashScreen = false

    var body: some View {
        NavigationView {
            List {
                AboutAppSectionView(isShowingSplashScreen: $isShowingSplashScreen)
                SendFeedbackSectionView()
                AppInfoSectionView()

                VStack() {
                    Text("Crafted with care by Alexandru Turcanu")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                    appVersionView
                        .foregroundColor(.secondary)
                        .font(.system(size: 12))
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)

            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .navigationBarTitle("Settings")
            .navigationBarItems(leading:
                Button(action: {
                    self.isPresented.toggle()
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .navigationBarStyle()
                })
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private var appVersionView: some View {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
            let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {

            return Text("Version: \(version) (\(build))")
        } else {
            return Text("#chad")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsListView(isPresented: .constant(true))
    }
}
