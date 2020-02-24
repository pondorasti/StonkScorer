//
//  FeatureInfoView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 02/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct FeatureInfoView: View {
    var featureInfo: FeatureInfoModel

    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: featureInfo.imageName)
                .font(.largeTitle)
                .foregroundColor(.mainColor)
                .padding()
                .accessibility(hidden: true)
                .frame(minWidth: 88)

            VStack(alignment: .leading) {
                Text(featureInfo.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .accessibility(addTraits: .isHeader)

                Text(featureInfo.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

struct FeatureInfoView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureInfoView(featureInfo: FeatureInfoModel(
            title: "Seamless Transitions",
            description: "120 Hz refresh rate",
            imageName: "battery.100")
        )
    }
}


