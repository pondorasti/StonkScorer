//
//  FeaturesContainerView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 02/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct FeaturesContainerView: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            FeatureInfoView(
                title: "User Focused App",
                description: "Intuitive user interfaces and seamless transitions.",
                imageName: "person.crop.square.fill"
            )

            FeatureInfoView(
                title: "Multi Platform Support",
                description: "Use the app on any device you would like. iPhone. iPad. Mac.",
                imageName: "aspectratio.fill"
            )

            FeatureInfoView(
                title: "Dark Mode Support",
                description: "Automatically switches between Light and Dark Mode based on your time.",
                imageName: "circle.righthalf.fill"
            )
        }
        .padding(.horizontal)
    }
}

struct FeaturesContainerView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturesContainerView()
    }
}
