//
//  SavedScoreRow.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 07/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct SavedScoreRow: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Team 14270")
                    .font(.headline)
                    .foregroundColor(.primary)
                Text("Match 3")
                    .font(.body)
                    .foregroundColor(.secondary)
            }

            Spacer()

            ZStack {
                Text("36")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.all, 8)
                    .background(
                        Circle()
                            .foregroundColor(.red)
                    )
            }
        }
    }
}

struct SavedScoreRow_Previews: PreviewProvider {
    static var previews: some View {
        SavedScoreRow()
    }
}
