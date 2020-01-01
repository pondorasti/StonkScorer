//
//  PickerView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 01/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct PickerView: View {
    @Binding var bindingProperty: Int

    var image: Image
    var title: String
    var options: [String]

    var body: some View {
        HStack() {
            image
                .font(.system(size: Constants.sfSymbolSize)) //MARK: this is not okay
                .frame(minWidth: Constants.iconMinWidth)

            Text("\(title)")

            Spacer(minLength: 48)

            Picker(title, selection: $bindingProperty) {
                ForEach(0 ..< options.count) {
                    Text("\(self.options[$0])")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(maxWidth: 256)
        }
    }
}
