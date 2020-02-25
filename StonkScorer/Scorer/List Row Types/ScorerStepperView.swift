//
//  ScorerStepperView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 01/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct ScorerStepperView: View {
    @Binding var bindingProperty: Int

    var image: Image
    var title: String
    var stepperRange: ClosedRange<Int> = 0...60

    var body: some View {
        Stepper(value: $bindingProperty, in: stepperRange) {
            HStack {
                image
                    .iconModifier()

                Text("\(title): \(bindingProperty)")
            }
        }
    }
}
