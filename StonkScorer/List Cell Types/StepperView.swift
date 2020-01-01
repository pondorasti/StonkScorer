//
//  StepperView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 01/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct StepperView: View {
    @Binding var bindingProperty: Int

    var icons: [Icon]
    var title: String
    var stepperRange: ClosedRange<Int> = 0...60

    var body: some View {
        Stepper(value: $bindingProperty, in: stepperRange) {
            HStack {
                ZStack(alignment: .top) {
                    ForEach(0 ..< icons.count) {
                        self.icons[$0]
                    }
                }
                .frame(minWidth: Constants.iconMinWidth)

                Text("\(title): \(bindingProperty)")
            }
        }
    }
}


