//
//  FeaturesStackView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 02/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct FeaturesStackView: View {

    var features: [FeatureInfoModel]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(features, id: \.self) {
                FeatureInfoView(featureInfo: $0)
            }
        }
        .padding(.horizontal)
    }
}

struct FeaturesContainerView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturesStackView(features: [FeatureInfoModel]())
    }
}
