//
//  SplashScreenView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 02/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct SplashScreenView: View {
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
                print("button pressed")
            }) {
                Text("Press me")
                    .customButton()
            }

            .padding(.horizontal)
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.mainColor)
                )
            .padding(.bottom)
    }
}

extension View {
    func customButton() -> ModifiedContent<Self, ButtonModifier> {
        return modifier(ButtonModifier())
    }
}
