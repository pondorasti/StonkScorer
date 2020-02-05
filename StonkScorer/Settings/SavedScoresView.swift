//
//  SavedScoresView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 05/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct SavedScoresView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: SkystoneScore.entity(), sortDescriptors: []) var scores: FetchedResults<SkystoneScore>

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SavedScoresView_Previews: PreviewProvider {
    static var previews: some View {
        SavedScoresView()
    }
}
