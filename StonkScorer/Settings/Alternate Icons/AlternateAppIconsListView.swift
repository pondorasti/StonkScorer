//
//  AlternateAppIconsListView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 15/02/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct AlternateAppIconsListView: View {
    var body: some View {
        List {
            ForEach(AppIconService.AppIcon.allCases, id: \.self) { appIcon in
                Button(action: {
                    AppIconService.changeIcon(to: appIcon)
                }) {
                    HStack {
                        Image(uiImage: UIImage(named: appIcon.rawValue) ?? UIImage())
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 48, height: 48)
                        Text("\(appIcon.rawValue)")
                            .foregroundColor(.primary)
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        .navigationBarTitle("App Icon")
    }
}

struct AlternateAppIconsView_Previews: PreviewProvider {
    static var previews: some View {
        AlternateAppIconsListView()
    }
}
