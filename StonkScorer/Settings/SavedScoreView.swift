//
//  SavedScoreView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 05/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct SavedScoreView: View {
    let savedScore: SkystoneScore

    @State private var showingDeleteAlert = false


    var body: some View {
        let scorer = Binding(
            get: { Scorer(from: self.savedScore) },
            set: { self.savedScore.update(from: $0) }
        )

        let matchInfo = Binding(
            get: { MatchInfo(from: self.savedScore) },
            set: { self.savedScore.update(from: $0)}
        )

        return List {
            ScorerGroup(matchInfo: matchInfo, scorer: scorer)

            // save button
            Section {
                Button(action: {
                    self.showingDeleteAlert.toggle()
                }, label: {
                    HStack {
                        Image(systemName: "trash.circle.fill")
                            .iconModifier()
                        Text("Delete Score")
                            .bold()
                        Spacer()
                    }
                })
                    .buttonStyle(BorderlessButtonStyle())
                    .alert(isPresented: $showingDeleteAlert) {
                        Alert(title: Text("Delete item?"),// TODO: better text
                            message: Text("Are you sure you want to make this go away for forever?"),
                            primaryButton: .default(Text("Cancel")),
                            secondaryButton: .destructive(Text("Delete"))
                        )
                }
            }
            .foregroundColor(.white)
            .listRowBackground(Color(UIColor.systemRed))
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
    }
}

//TODO: initialize scorer from binding
