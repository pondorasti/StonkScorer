//
//  ContentView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 31/12/2019.
//  Copyright © 2019 CodingBytes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var foundationRepositioned = false

    @State private var numberOfSkystoneBonuses = 0
    @State private var skystoneBonusOptions = [0, 1, 2]

    @State private var stonesDelivered = 0
    @State private var stonesPlaced = 0


    @State private var numberOfNavigationOptions = 0
    @State private var navigatingOptions = ["None", "One", "Both"]

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Autonomous").font(.headline)) {
                    Toggle(isOn: $foundationRepositioned) {
                        Text("Repositioning")
                    }

                    HStack(spacing: 56) {
                        Text("Skystone Bonus")
                        Picker(selection: $numberOfSkystoneBonuses, label: Text("Skystone Bonus")) {
                            ForEach(0 ..< skystoneBonusOptions.count) {
                                Text("\(self.skystoneBonusOptions[$0])")
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }

                    Stepper("Stones Delivered: \(stonesDelivered)",
                        value: $stonesDelivered,
                        in: 0...6
                    )

                    Stepper("Stones Placed: \(stonesPlaced)",
                        value: $stonesPlaced,
                        in: 0...6
                    )

                    HStack(spacing: 56) {
                        Text("Navigating")
                        Picker(selection: $numberOfNavigationOptions, label: Text("Navigating")) {
                            ForEach(0 ..< navigatingOptions.count) {
                                Text(self.navigatingOptions[$0])
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }

                    HStack() {
                        Text("Total Pts")
                        Text("56")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .navigationBarTitle("Scorer")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
