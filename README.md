# FTC Scorer - Skystone

<p align="center">
  <a href="https://trello.com/b/HaJ3UhcV">
      <img src="https://img.shields.io/badge/Vote-Trello-%2361BD4F.svg" alt="Swift 5.0">
  </a>
  <a href="https://github.com/Pondorasti/StonkScorer/blob/master/LICENSE">
      <img src="https://img.shields.io/github/license/pondorasti/stonkscorer" alt="Swift 5.0">
  </a>
</p>

FTC Scorer is a dead simple yet powerful way of scoring your practice matches.

## Features

- [x] Multi Platform Support - iPhone, iPad, Mac
- [x] Dark Mode Support
- [x] Save Scores 
- [x] Scorer Assist 
- [x] Alternate App Icons
- [x] iMessage Sticker App

## Description

This project started as a playground for experimenting with **SwiftUI** and evolved into something a bit more than that 😅. Although I had never worked before with declarative APIs, I found SwiftUI very intuitive and easy to grasp from a couple of Medium Articles and WWDC sessions, but not from Apple's documentation that is a complete waste of time. Along my journey, I had a couple of ups and downs. Nevertheless, I am looking forward in approaching my next projects with SwiftUI, now that I got the hang of it. Anyway, before I go here's some of my impressions and thoughts:

* SwiftUI encourages reusable and modular snippets of code  🥳, something that I wish was easier with UIKit.
* SF Symbols are fantastic 🤩 !
* SwiftUI makes it a pain-free process to adopt and implement OS level features: Dark Mode, Accessibility, Dynamic Type, etc.
* The framework is relatively still in its early stages, chances are that you will quickly find the need for an object that has not yet been implemented (ex: multiline textfield, share sheet, etc), but there is a workaround for injecting UIKit code with UIViewRepresentable.
* Navigations Bar and the macOS version feel laggy and buggy 🤨, not the production quality I was expecting.
* Working with CoreData seems quite nice using @FetchRequest
* SwiftUI is wonderful for writing cross platform apps, since there's only one Framework that interprets your code for each operating system. The downside is that you can't use the same UI code for an iPhone & Mac app (you will have to rewrite it), therefore I've ported the app to macOS using Catalyst.

## App Preview

<p align="center">
   <image src="https://media.giphy.com/media/Q8xsudWIpz65w1Fh28/giphy.gif" width="200">
</p>

## Screenshots

<p align="center">
    <img src="https://github.com/Pondorasti/StonkScorer/blob/master/External%20Assets/iOS%20Screenshots/V1.1/6.5/3d%20-%201.png" width="400">
    <img src="https://github.com/Pondorasti/StonkScorer/blob/master/External%20Assets/iOS%20Screenshots/V1.1/6.5/3d%20-%202.png" width="400">
  <img src="https://github.com/Pondorasti/StonkScorer/blob/master/External%20Assets/iOS%20Screenshots/V1.1/6.5/3d%20-%203.png" width="400">
  <img src="https://github.com/Pondorasti/StonkScorer/blob/master/External%20Assets/iOS%20Screenshots/V1.1/6.5/3d%20-%204.png" width="400">
  <img src="https://github.com/Pondorasti/StonkScorer/blob/master/External%20Assets/iOS%20Screenshots/V1.1/6.5/3d%20-%205.png" width="400">
  <img src="https://github.com/Pondorasti/StonkScorer/blob/master/External%20Assets/iOS%20Screenshots/V1.1/6.5/3d%20-%206.png" width="400">
</p>

## Author

Crafted with care by Alexandru Turcanu


[![Twitter Follow](https://img.shields.io/twitter/follow/pondorasti.svg?style=social)](https://twitter.com/pondorasti)

[![Github Follow](https://img.shields.io/github/followers/pondorasti.svg?style=social&label=Follow)](https://github.com/pondorasti)


## License

FTC Scorer is available under the MIT license. See the [LICENSE](https://github.com/Pondorasti/StonkScorer/blob/master/LICENSE) file for more info.
