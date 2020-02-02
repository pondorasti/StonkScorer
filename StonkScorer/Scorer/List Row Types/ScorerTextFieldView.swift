//
//  ScorerTextFieldView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 02/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct ScorerTextFieldView: View {
    @Binding var bindingValue: String

    var image: Image? = nil
    var title = "Team"
    var placeholder = "1"

    var body: some View {
        HStack {
            image?
                .iconModifier()
            
            Text(title)

            TextField(placeholder, text: $bindingValue)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.trailing)
                .padding(.trailing)
        }
    }
}
