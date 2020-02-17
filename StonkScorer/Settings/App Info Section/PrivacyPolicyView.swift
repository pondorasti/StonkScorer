//
//  PrivacyPolicyView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 16/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct PrivacyPolicyView: View {
    @State var showingClipboardAlert = false

    var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    Group {
                        Text("FTC Scorer")
                            .foregroundColor(Color(UIColor.systemBlue))
                            .bold()
                        + Text(" was built independently by Alexandru Turcanu, a romanian based iOS app developer, as an Open-Source app. ")
                        + Text("I would never want my own privacy violated, so I'll treat your data how I'd want mine to be treated.")
                            .foregroundColor(Color(UIColor.systemPink))
                            .bold()
                    }

                    Group {
                        Text("The app does not collect or store any user data or information, apart from locally storing your saved scores on device. ")
                        + Text("You can find out more about Apple's privacy policy ")
                        + Text("here.")
                            .bold()
                            .underline()
                    }
                    .onTapGesture {
                        URL.open(link: .applePrivacyPolicy)
                    }

                    Text("No third parties are used to collect or store data or analytics, and no services that may be used to identify or track you are used. No other services get access to the app or your data.")

                    Group {
                        Text("If you have any questions, please do not hesitate to contact me at ")
                        + Text("ftc@alexandruturcanu.com")
                            .underline()
                    }
                    .onTapGesture {
                        UIPasteboard.general.string = "ftc@alexandruturcanu.com"
                        self.showingClipboardAlert.toggle()
                    }
                    .alert(isPresented: $showingClipboardAlert) {
                        Alert(title: Text("Email copied to clipboard!"))
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        .navigationBarTitle("Privacy Policy", displayMode: .inline)
    }
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}

//TODO: generalize support email by using a constant, less stringly typed values :]
