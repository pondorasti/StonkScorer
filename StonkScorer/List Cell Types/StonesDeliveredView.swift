//
//  StonesDeliveredView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 31/12/2019.
//  Copyright © 2019 CodingBytes. All rights reserved.
//

import SwiftUI

struct StonesDeliveredView: View {
    @Binding var stonesDelivered: Int

    var body: some View {
        Stepper(value: $stonesDelivered, in: 0...6) {
            HStack {
                ZStack(alignment: .top) {
                    Image("Stone")
                        .foregroundColor(Color(UIColor.systemYellow))
                }
                Text("Stones Placed: \(stonesDelivered)")
            }
        }
    }
}
