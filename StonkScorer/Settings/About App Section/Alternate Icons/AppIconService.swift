//
//  AppIconService.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 14/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import UIKit

class AppIconService {
    enum AppIcon: String, CaseIterable {
        case primary = "Primary"
        case blue = "Blue"
        case purple = "Purple"
        case pitchBlack = "Pitch Black"
        case neon = "Neon"
        case sixColors = "Six Colors"
        case noise = "Noise"
    }

    static func changeIcon(to appIconName: AppIcon) {
        let name: String?
        if appIconName == .primary {
            name = nil
        } else {
            name = appIconName.rawValue
        }

        UIApplication.shared.setAlternateIconName(name) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Success!")
            }
        }
    }
}


//For future reference, here's some code to retrieve the current AppIcon
//Your class will need to conform to ObservableObject in order to use @Published
//
//@Published var currentIcon = AppIcon.primary
//
//if let currentIcon = UIApplication.shared.alternateIconName,
//    let icon = AppIcon(rawValue: currentIcon) {
//    self.currentIcon = icon
//}
