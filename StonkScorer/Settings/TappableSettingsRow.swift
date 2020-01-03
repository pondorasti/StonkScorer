//
//  TappableSettingsRow.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 03/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct TappableSettingsRow: View {

    var image: Image
    var imageColor: Color
    var title: String

    var action: () -> ()

    var body: some View {

        Button(action: {
            self.action()
        }) {
            HStack {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(imageColor)
                    .frame(width: Constants.sfSymbolSize, height: Constants.sfSymbolSize, alignment: .center)

                Text(title)
                    .foregroundColor(.primary)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(Color(UIColor.systemGray))
            }
        }
    }
}
