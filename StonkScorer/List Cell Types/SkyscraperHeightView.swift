//
//  SkyscraperHeightView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 31/12/2019.
//  Copyright © 2019 CodingBytes. All rights reserved.
//

import SwiftUI

struct SkyscraperHeightView: View {
   @Binding var skyscraperHeight: Int

    var body: some View {
        Stepper(value: $skyscraperHeight, in: 0...6) {
            HStack {
                ZStack(alignment: .top) {
                    Image("MiniFoundationV2")
                        .foregroundColor(Color(UIColor.systemBlue))
                    Image("Skyscraper")
                        .foregroundColor(Color(UIColor.systemYellow))
                }
                Text("Skyscraper Height: \(skyscraperHeight)")
            }
        }
    }
}
