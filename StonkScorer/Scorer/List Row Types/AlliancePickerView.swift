//
//  AlliancePickerView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 02/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct AlliancePickerView: View {
    @Binding var allianceColor: Int

    var options = ["Blue", "Red"]

    var body: some View {
        HStack() {
            RoundedRectangle(cornerRadius: (allianceColor == 0 ? Constants.sfSymbolSize / 2 : 4))
                .frame(width: Constants.sfSymbolSize, height: Constants.sfSymbolSize, alignment: .center)
                .frame(minWidth: Constants.iconMinWidth)
                .foregroundColor(allianceColor == 0 ? Color(UIColor.systemBlue) : Color(UIColor.systemRed))
                .rotation3DEffect(allianceColor == 0 ? .degrees(0) : .degrees(-180), axis: (x: 1, y: 0, z: 0))
                .animation(.easeInOut)

            Text("Alliance Color")

            Spacer(minLength: 48)

            Picker("Alliance Color", selection: $allianceColor) {
                ForEach(0 ..< options.count) {
                    Text(self.options[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(maxWidth: Constants.pickerMaxWidth)
        }
    }
}
