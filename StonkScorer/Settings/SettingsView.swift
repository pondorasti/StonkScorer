//
//  SettingsView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 02/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI
import MessageUI

struct SettingsView: View {

    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Send Feedback").font(.headline)) {

                    TappableSettingsRow(
                        image: Image(systemName: "envelope.fill"),
                        imageColor: Color(UIColor.systemBlue),
                        title: "Email") {
//                            self.sendEmail()
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

                    Button(action: {
                        self.isShowingMailView.toggle()
                    }) {
                        Text("Tap Me")
                    }
                    .disabled(!MFMailComposeViewController.canSendMail())
                    .sheet(isPresented: $isShowingMailView) {
                        MailView(result: self.$result)

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
        .navigationViewStyle(StackNavigationViewStyle())
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


