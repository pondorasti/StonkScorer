//
//  Image.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 01/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import Foundation
import SwiftUI

extension Image {
    enum IconNames: String {
        case skystone
        case stonePlaced
        case skyscraper
        case stoneDelivered
        case stone
        case foundation
        case capstoneLevel
        case capstone
        case twitter

    }

    init(iconName: IconNames) {
        self.init(decorative: iconName.rawValue)
    }

    func navigationBarStyle() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: Constants.navBarIcons, height: Constants.navBarIcons, alignment: .center)
    }
}
