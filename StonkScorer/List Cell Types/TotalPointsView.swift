//
//  TotalPointsView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 31/12/2019.
//  Copyright © 2019 CodingBytes. All rights reserved.
//

import SwiftUI

struct TotalPointsView: View {
    @Binding var scorer: TotalPoints

    var body: some View {
        HStack() {
            Image(systemName: "a.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 24)
            Text("Total Points")
            Text("\(scorer.totalPoints)")
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
        }
    }
}

//struct TotalPointsView_Previews: PreviewProvider {
//    static var previews: some View {
//        TotalPointsView()
//    }
//}
