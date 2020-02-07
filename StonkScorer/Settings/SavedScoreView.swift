//
//  SavedScoreView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 05/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct SavedScoreView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc

    @State var savedScore: SkystoneScore
    @State var matchInfo: MatchInfo
    @State var scorer: Scorer

    @State private var showingDeleteAlert = false
    @State private var editingMode = false

    @State var text = "Edit"


    var body: some View {
        List {
            ScorerGroup(matchInfo: $matchInfo, scorer: $scorer)
                .disabled(!editingMode)

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
                            secondaryButton: .destructive(Text("Delete"), action: {
                                self.savedScore.delete(in: self.moc)
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
        .navigationBarItems(trailing:
            Button(action: {
                self.editingMode.toggle()

                if self.editingMode {
                    self.text = "Done"
                    self.savedScore.update(
                        from: self.matchInfo,
                        and: self.scorer,
                        in: self.moc
                    )
                } else {
                    self.text = "Edit"
                }
            }, label: {
                Text(text)
            })
        )
    }
}
