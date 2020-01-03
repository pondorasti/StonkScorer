//
//  SettingsView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 02/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI
import UIKit
import WebKit
import SafariServices

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Send Feedback").font(.headline)) {

                    TappableSettingsRow(
                        image: Image(systemName: "envelope.fill"),
                        imageColor: Color(UIColor.systemBlue),
                        title: "Email") {
                            self.openWebsite()
                    }


                    TappableSettingsRow(
                        image: Image(systemName: "envelope.fill"),
                        imageColor: Color(UIColor.systemBlue),
                        title: "Twitter") {
                            self.openWebsite()
                    }

                    TappableSettingsRow(
                        image: Image(systemName: "star.fill"),
                        imageColor: Color(UIColor.systemYellow),
                        title: "Rate in App Store") {
                            self.openWebsite()
                    }
                }

                Section(header: Text("Info").font(.headline)) {

                    TappableSettingsRow(
                        image: Image(systemName: "square.and.arrow.up.fill"),
                        imageColor: Color(UIColor.systemBlue),
                        title: "Share FTC Scouter") {
                            self.openWebsite()
                    }


                    TappableSettingsRow(
                        image: Image(systemName: "lock.fill"),
                        imageColor: Color(UIColor.systemPink),
                        title: "Privacy Policy") {
                            self.openWebsite()
                    }

                    TappableSettingsRow(
                        image: Image(systemName: "info.circle.fill"),
                        imageColor: Color(UIColor.systemBlue),
                        title: "About") {
                            self.openWebsite()
                    }
                }

            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .navigationBarTitle("Settings")
        }

    }

    func openWebsite() {
        if let url = URL(string: "itms-apps://itunes.apple.com/app/id1423771095"),
            UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:])
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController,
                                context: UIViewControllerRepresentableContext<SafariView>) {

    }

}
