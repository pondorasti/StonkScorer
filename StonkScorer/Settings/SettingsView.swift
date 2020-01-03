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
    @Binding var isPresented: Bool

    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    @State var isShowingSplashScreen = false

    var body: some View {
        NavigationView {
            List {

                Section(header: Text("About the App").font(.headline)) {
                    //MARK: try this with a NavigationLink
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

                Section(header: Text("Send Feedback").font(.headline)) {

                    Button(action: {
                        self.isShowingMailView.toggle()
                    }) {
                        SettingsRowView(
                            image: Image(systemName: "envelope.circle.fill"),
                            imageColor: Color(UIColor.systemBlue),
                            title: "Email"
                        )
                    }
                    .disabled(!MFMailComposeViewController.canSendMail())
                    .sheet(isPresented: $isShowingMailView) {
                        MailView(result: self.$result)
                    }

                    TappableSettingsRow(
                        image: Image(iconName: .twitter),
                        imageColor: Color(UIColor.systemBlue),
                        title: "Twitter") {
                            self.openWebsite()
                    }

                    TappableSettingsRow(
                        image: Image(systemName: "star.circle.fill"),
                        imageColor: Color(UIColor.systemYellow),
                        title: "Rate in App Store") {
                            self.openWebsite()
                    }


                }

                Section(header: Text("Info").font(.headline)) {

                    TappableSettingsRow(
                        image: Image(systemName: "square.and.arrow.up"),
                        imageColor: Color(UIColor.systemBlue),
                        title: "Share FTC Scouter") {
                            self.openWebsite()
                    }


                    TappableSettingsRow(
                        image: Image(systemName: "lock.circle.fill"),
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

    func openWebsite() {
        if let url = URL(string: "itms-apps://itunes.apple.com/app/id1423771095"),
            UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:])
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isPresented: .constant(true))
    }
}


extension UIApplication {
    class var topViewController: UIViewController? { return getTopViewController() }
    private class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController { return getTopViewController(base: nav.visibleViewController) }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController { return getTopViewController(base: selected) }
        }
        if let presented = base?.presentedViewController { return getTopViewController(base: presented) }
        return base
    }
}

extension Hashable {
    func share() {
        let activity = UIActivityViewController(activityItems: [self], applicationActivities: nil)
        UIApplication.topViewController?.present(activity, animated: true, completion: nil)
    }
}
