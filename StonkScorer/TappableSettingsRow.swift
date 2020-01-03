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
    var title: String

    var action: () -> ()


    var body: some View {
        HStack {
            image
                .foregroundColor(Color(UIColor.systemBlue))
                .font(.system(size: Constants.sfSymbolSize))
                .frame(minWidth: Constants.iconMinWidth)
            Text(title)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(Color(UIColor.systemGray))
        }
        .background(Color(UIColor.secondarySystemBackground))
        .onTapGesture {
            self.action()
        }
    }
}

//struct TappableSettingsRow_Previews: PreviewProvider {
//    static var previews: some View {
//        TappableSettingsRow(image: Image(systemName: "envelope.fill"), title: "Email", action: <#() -> ()#>)
//    }
//}
