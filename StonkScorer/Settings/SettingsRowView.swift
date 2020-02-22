//
//  SettingsRowView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 03/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct SettingsRowView: View {

    var image: Image
    var imageColor: Color
    var title: String
    var description: String = ""
    var shouldShowDisclosureIcon = true

    var body: some View {
        HStack {
            image
                .iconModifier()
                .foregroundColor(imageColor)

            VStack {
                Text(title)
                    .foregroundColor(.primary)

                Text(description)
                    .font(.body)
                    .foregroundColor(.secondary)
            }


            Spacer()

            if shouldShowDisclosureIcon {
                Image(systemName: "chevron.right")
                .foregroundColor(Color(UIColor.systemGray))

            }
        }
    }
}
