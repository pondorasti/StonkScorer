//
//  Helper.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 01/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import Foundation
import CoreGraphics
import SwiftUI

struct Constants {
    static let iconMinWidth: CGFloat = 32
}

struct Icon: View {
    enum IconNames: String {
        case stone = "Stone"
        case skyscraper = "Skyscraper"
        case miniFoundation = "MiniFoundation"
        case miniFoundationV2 = "MiniFoundationV2"

        func retrieveColor() -> Color {
            switch self {
            case .stone, .skyscraper:
                return Color(UIColor.systemYellow)
            case .miniFoundation, .miniFoundationV2:
                return Color(UIColor.systemBlue)
            }
        }
    }

    var iconName: IconNames

    init(name iconName: IconNames) {
        self.iconName = iconName
    }

    var body: some View {
        Image(iconName.rawValue)
            .foregroundColor(iconName.retrieveColor())
    }

}
