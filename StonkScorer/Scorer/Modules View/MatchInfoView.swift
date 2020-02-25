//
//  MatchInfoView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 05/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct MatchInfoView: View {
    @Binding var matchInfo: MatchInfo

    var body: some View {
        Section(header: Text("Match Info").font(.headline)) {

            AlliancePickerView(allianceColor: $matchInfo.allianceColor)

            ScorerTextFieldView(
                bindingValue: $matchInfo.teamNumber,
                image: Image(systemName: "t.circle.fill"),
                title: "Team Number",
                placeholder: "14270"
            ).keyboardType(.numberPad)

            ScorerTextFieldView(
                bindingValue: $matchInfo.matchNumber,
                image: Image(systemName: "m.circle.fill"),
                title: "Match Number",
                placeholder: "12"
            ).keyboardType(.numberPad)

            TextField("Comments", text: $matchInfo.comments)
        }
    }
}
