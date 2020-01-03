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
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(imageColor)
                    .font(.system(size: Constants.sfSymbolSize))
                    .frame(minWidth: Constants.iconMinWidth)

                Text(title)
                    .foregroundColor(.primary)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(Color(UIColor.systemGray))
            }
        }
    }
}

//struct TappableSettingsRow_Previews: PreviewProvider {
//    static var previews: some View {
//        TappableSettingsRow(image: Image(systemName: "envelope.fill"), title: "Email", action: <#() -> ()#>)
//    }
//}
