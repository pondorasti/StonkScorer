//
//  DismissKeyboardModifier.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 14/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct DismissKeyboardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .gesture(DragGesture().onChanged { _ in
                UIApplication.shared.sendAction(
                    #selector(UIResponder.resignFirstResponder),
                    to: nil,
                    from: nil,
                    for: nil
                )
            })
    }
}

extension View {
    func shouldDismissKeyboard() -> ModifiedContent<Self, DismissKeyboardModifier> {
        return modifier(DismissKeyboardModifier())
    }
}
