//
//  SavedScoreDetailView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 05/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct SavedScoreDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc

    @ObservedObject var score: SkystoneScore

    @State private var showingDeleteAlert = false

    var body: some View {
        let scorer = Binding(
            get: { Scorer(from: self.score) },
            set: { self.score.update(scorer: $0, in: self.moc) }
        )

        let matchInfo = Binding(
            get: { MatchInfo(from: self.score) },
            set: { self.score.update(matchInfo: $0, in: self.moc) }
        )

        return List {
            ScorerGroup(matchInfo: matchInfo, scorer: scorer)

            //MARK: - Delete Button
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
                    Alert(title: Text("Delete item?"),
                        message: Text("There is no turning back."),
                        primaryButton: .default(Text("Cancel")),
                        secondaryButton: .destructive(Text("Delete"), action: {
                            self.score.delete(in: self.moc)
                            self.presentationMode.wrappedValue.dismiss()
                        })
                    )
                }
            }
            .foregroundColor(.white)
            .listRowBackground(Color(UIColor.systemRed))
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        .navigationBarTitle("Score")
        .shouldDismissKeyboard()
    }
}
