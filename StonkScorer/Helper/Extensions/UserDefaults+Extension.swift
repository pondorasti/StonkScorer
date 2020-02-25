//
//  UserDefaults.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 02/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import Foundation

extension UserDefaults {
    enum Keys: String {
        case showingMatchInfo
        case showingNewUserView
        case shouldAssistScoring
        case firstUpdate

        static func retrieveObject(for key: Keys) -> Any? {
            return UserDefaults.standard.object(forKey: key.rawValue)
        }

        static func setObject(for key: Keys, with value: Any?) {
            UserDefaults.standard.set(value, forKey: key.rawValue)
        }
    }
}
