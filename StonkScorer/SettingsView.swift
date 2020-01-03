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
            Form {
                Section(header: Text("Send Feedback").font(.headline)) {

                    TappableSettingsRow(
                        image: Image(systemName: "envelope.fill"),
                        title: "aril") {
                            if let url = URL(string: "itms-apps://itunes.apple.com/app/id1423771095"),
                                UIApplication.shared.canOpenURL(url){
                                UIApplication.shared.open(url, options: [:])
                            }
                    }

                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color(UIColor.systemBlue))
                            .font(.system(size: Constants.sfSymbolSize))
                            .frame(minWidth: Constants.iconMinWidth)
                        Text("Email")
                            .font(.headline)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .onTapGesture {
                        if let url = URL(string: "itms-apps://itunes.apple.com/app/id1423771095"),
                            UIApplication.shared.canOpenURL(url){
                            UIApplication.shared.open(url, options: [:])
                        }
                    }

                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color(UIColor.systemBlue))
                            .font(.system(size: Constants.sfSymbolSize))
                            .frame(minWidth: Constants.iconMinWidth)
                        Text("Twitter")
                            .font(.headline)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }

                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color(UIColor.systemBlue))
                            .font(.system(size: Constants.sfSymbolSize))
                            .frame(minWidth: Constants.iconMinWidth)
                        Text("Rate in App Store")
                            .font(.headline)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }

                }

            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
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
