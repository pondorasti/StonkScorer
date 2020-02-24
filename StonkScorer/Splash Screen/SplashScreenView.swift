//
//  SplashScreenView.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 02/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var isPresented: Bool
    var splashScreenInfo: SplashScreen.Information

    var body: some View {
        VStack {
            ScrollView {
                Spacer(minLength: 64)
                VStack(alignment: .center, spacing: 32) {
                    SplashScreenTitleView(titleInfo: splashScreenInfo.titleInfo)
                    FeaturesContainerView(features: splashScreenInfo.features)
                }
            }

            Button(action: {
                self.isPresented.toggle()
                self.updateUserDefaults()
            }) {
                Text("Continue")
                    .customButton()
            }.padding(.horizontal)
        }
        .onDisappear {
            self.updateUserDefaults()
        }
    }

    private func updateUserDefaults() {
        UserDefaults.Keys.setObject(for: splashScreenInfo.userDefaultstKey, with: false)
    }
}

struct SplashScreen {
    enum Version: CaseIterable {
        case welcomeScreen
        case firstUpdate

        static func retrieveObject(for version: Version) -> Information {
            switch version {
            case .welcomeScreen:
                return Information(
                    userDefaultstKey: .showingNewUserView,
                    name: "Version 1.0",
                    titleInfo: SplashScreenTitleModel(
                        imageName: "person.3.fill",
                        upperTittle: "Welcome to",
                        lowerTitle: "FTC Scorer"
                ), features: [
                    FeatureInfoModel(
                        title: "User Focused App",
                        description: "Intuitive user interfaces and seamless transitions.",
                        imageName: "person.crop.square.fill"
                    ),
                    FeatureInfoModel(
                        title: "Multi Platform Support",
                        description: "Use the app on any device you would like. iPhone. iPad. Mac.",
                        imageName: "aspectratio.fill"
                    ),
                    FeatureInfoModel(
                        title: "Dark Mode Support",
                        description: "Automatically switches between Light and Dark Mode based on your time.",
                        imageName: "circle.righthalf.fill"
                    )
                ])
            case .firstUpdate:
                return Information(
                    userDefaultstKey: .firstUpdate,
                    name: "Version 1.1",
                    titleInfo: SplashScreenTitleModel(
                        imageName: "person.3.fill",
                        upperTittle: "What's new",
                        lowerTitle: "FTC Scorer"
                ), features: [
                    FeatureInfoModel(
                        title: "Save Scores",
                        description: "Save scores for future reference with the ability to export them.",
                        imageName: "bookmark.fill"
                    ),
                    FeatureInfoModel(
                        title: "Scorer Assist",
                        description: "Hassle-free and faster scoring than any other app.",
                        imageName: "wand.and.stars"
                    ),
                    FeatureInfoModel(
                        title: "Alternate App Icons",
                        description: "No matter your wallpaper there's always one that suits you.",
                        imageName: "square.stack.fill"
                    )
                ])
            }
        }
    }

    struct Information {
        var userDefaultstKey: UserDefaults.Keys = .showingNewUserView
        var name = "Version 1.0"
        var titleInfo = SplashScreenTitleModel()
        var features = [FeatureInfoModel]()

        init(userDefaultstKey: UserDefaults.Keys, name: String, titleInfo: SplashScreenTitleModel, features: [FeatureInfoModel]) {
            self.userDefaultstKey = userDefaultstKey
            self.name = name
            self.titleInfo = titleInfo
            self.features = features
        }

        init(version: Version) {
            self = Version.retrieveObject(for: version)
        }
    }
}
