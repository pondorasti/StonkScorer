//
//  SplashScreenTitleView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 02/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct SplashScreenTitleView: View {
    var titleInfo: SplashScreenTitleModel

    var body: some View {
        VStack {
            Image(systemName: titleInfo.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, alignment: .center)
                .accessibility(hidden: true)
                .foregroundColor(.mainColor)

            VStack(alignment: .leading) {
                Text(titleInfo.upperTittle)
                    .fontWeight(.black)
                    .font(.system(size: 36))

                Text(titleInfo.lowerTitle)
                    .fontWeight(.black)
                    .font(.system(size: 36))
                    .foregroundColor(.mainColor)
            }
        }
    }
}

struct SplashScreenTitleModel {
    var imageName = "person.3.fill"
    var upperTittle = "Welcome to"
    var lowerTitle = "FTC Scorer"
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenTitleView(titleInfo: SplashScreenTitleModel())
    }
}
