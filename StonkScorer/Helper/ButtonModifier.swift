//
//  ButtonModifier.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 05/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import Foundation
import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: 480, alignment: .center)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.mainColor)
                )
            .padding(.bottom)
            .padding(.bottom)
    }
}

extension View {
    func customButton() -> ModifiedContent<Self, ButtonModifier> {
        return modifier(ButtonModifier())
    }
}
