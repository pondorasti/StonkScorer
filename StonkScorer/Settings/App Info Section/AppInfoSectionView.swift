//
//  AppInfoSectionView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 04/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct AppInfoSectionView: View {
    var body: some View {
        Section(header: Text("Info").font(.headline)) {

            //MARK: - Share
            Button(action: {
                URL.appLinks.appStore.rawValue.share()
            }) {
                SettingsRowView(
                    image: Image(systemName: "square.and.arrow.up"),
                    imageColor: Color(UIColor.systemBlue),
                    title: "Share FTC Scorer"
                )
            }

            //MARK: - Privacy Policy
            ZStack {
                NavigationLink(destination: PrivacyPolicyView()) {
                    EmptyView()
                }
                SettingsRowView(
                    image: Image(systemName: "lock.circle.fill"),
                    imageColor: Color(UIColor.systemPink),
                    title: "Privacy Policy"
                )
            }

            //MARK: - About
            ZStack { //embedding the NavLink inside the ZStack and giving it an EmptyView() in order to hide the automatic disclorure indicator
                NavigationLink(destination: AboutView()) {
                    EmptyView()
                }
                SettingsRowView(
                    image: Image(systemName: "info.circle.fill"),
                    imageColor: Color(UIColor.systemBlue),
                    title: "About"
                )
            }
        }
    }
}

struct AppInfoSectionView_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoSectionView()
    }
}
