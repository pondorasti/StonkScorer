//
//  ToggleView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 01/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct ToggleView: View {
    @Binding var bindingProperty: Bool

    var image: Image
    var title: String

    var body: some View {
        Toggle(isOn: $bindingProperty) {
            HStack {
                Image(iconName: .foundation)
                    .foregroundColor(bindingProperty ? Color(UIColor.systemBlue) : Color(UIColor.systemGray2))
                    .frame(minWidth: Constants.iconMinWidth)

                Text("\(title)")
            }
        }
    }
}
