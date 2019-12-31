//
//  StonesPlacedView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 31/12/2019.
//  Copyright © 2019 CodingBytes. All rights reserved.
//

import SwiftUI

struct StonesPlacedView: View {
    @Binding var stonesPlaced: Int

    var body: some View {
        Stepper(value: $stonesPlaced, in: 0...6) {
            HStack {
                ZStack(alignment: .top) {
                    Image("MiniFoundation")
                        .foregroundColor(Color(UIColor.systemBlue))
                    Image("Stone")
                        .foregroundColor(Color(UIColor.systemYellow))

                }
                Text("Stones Placed: \(stonesPlaced)")
            }
        }
    }
}

//struct StonesPlacedView_Previews: PreviewProvider {
//    static var previews: some View {
//        StonesPlacedView(stonesPlaced: 5)
//    }
//}
