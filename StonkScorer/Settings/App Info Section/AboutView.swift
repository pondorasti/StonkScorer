//
//  AboutView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 04/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        List {
            Section() {
                Text("FTC Scorer")
                    .font(.system(size: 28))
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            }

            Section() {
                VStack(alignment: .leading, spacing: 16) {
                    Text("👋 Hey, I'm Alexandru Turcanu")

                    Group {
                        Text("I'm a member of ")
                        + Text("Quantum Robotics #14270")
                            .foregroundColor(Color(UIColor.systemBlue))
                            .bold()
                        + Text(" in Romania by day, and a designer and indie app developer by night.")
                    }
                    .onTapGesture {
                        URL.open(link: .quantumRobotics)
                    }

                    Text("This app started with me playing around with SwiftUI, originally developing this for myself. I wanted a dead simple scoring app for FTC - Skystone that integrates perfectly with Apple's platforms without a busy and confusing interface.")

                    Text("I'd love to hear what you think! You can reach me on Twitter or send me an Email.")

                    Text("If you like the app, you could share it with your friends, or leave a review on the app store ⭐️ !")

                    Group {
                        Text("I couldn't finish writing this paragraph without listening to some ")
                        + Text("Dark Noise")
                            .foregroundColor(Color(UIColor.systemIndigo))
                            .bold()
                        + Text("-s, kudos to Charlie Chapman for inspiring me to add this section to the app")
                    }
                    .onTapGesture {
                        URL.open(link: .darkNoise)
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        .navigationBarTitle("About", displayMode: .inline)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
