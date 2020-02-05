//
//  SplashScreenView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 02/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            ScrollView {
                Spacer(minLength: 64)
                VStack(alignment: .center, spacing: 32) {
                    TitleView()
                    FeaturesContainerView()
                }
            }

            Button(action: {
                self.isPresented.toggle()
                self.updateUserDefaults()
            }) {
                Text("Continue")
                    .customButton()
            }.padding(.horizontal)
        }
        .onDisappear {
            self.updateUserDefaults()
        }
    }

    private func updateUserDefaults() {
        UserDefaults.Keys.setObject(for: .showingNewUserView, with: false)
    }
}
