//
//  ImageModifier.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 02/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import Foundation
import SwiftUI

extension Image {
    func iconModifier() -> some View {
        self
            .font(.system(size: Constants.sfSymbolSize))
            .frame(minWidth: Constants.iconMinWidth)
            .accessibility(hidden: true)
    }
}
