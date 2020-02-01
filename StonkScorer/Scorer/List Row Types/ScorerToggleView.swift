//
//  ScorerToggleView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 01/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct ScorerToggleView: View {
    
    @Binding var bindingProperty: Bool

    var image: Image
    var title: String

    var body: some View {
        Toggle(isOn: $bindingProperty) {
            HStack {
                Image(iconName: .foundation)
                    .foregroundColor(.white)
                    .colorMultiply(bindingProperty ? Color(.systemBlue) : Color(.systemGray2))
                    .frame(minWidth: Constants.iconMinWidth)
                    .animation(.linear)

                Text(title)
            }
        }
    }
}
