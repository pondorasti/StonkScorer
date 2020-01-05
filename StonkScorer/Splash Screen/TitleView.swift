//
//  TitleView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 02/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct TitleView: View {
    
    let imageName = "person.3.fill"

    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, alignment: .center)
                .accessibility(hidden: true)
                .foregroundColor(.mainColor)

            VStack(alignment: .leading) {
                Text("Welcome to")
                    .fontWeight(.black)
                    .font(.system(size: 36))

                Text("FTC Scorer")
                    .fontWeight(.black)
                    .font(.system(size: 36))
                    .foregroundColor(.mainColor)
            }
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
