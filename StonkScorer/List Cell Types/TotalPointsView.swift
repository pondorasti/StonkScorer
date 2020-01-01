//
//  TotalPointsView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 31/12/2019.
//  Copyright © 2019 CodingBytes. All rights reserved.
//

import SwiftUI

struct TotalPointsView: View {
    @Binding var scor: Int

    var body: some View {
        HStack() {
            Image(systemName: "a.circle.fill")
                .font(.headline)
                .frame(minWidth: Constants.iconMinWidth)

            Text("Total Points")

            Text("\(scor)")
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
        }
    }
}
