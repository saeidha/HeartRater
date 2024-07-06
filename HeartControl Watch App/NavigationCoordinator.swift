//
//  NavigationCoordinator.swift
//  HeartControl Watch App
//
//  Created by saeid on 7/6/24.
//

import SwiftUI

// Screens that we need to navigate
enum Screens: Hashable {
    case home
    case settingMin
    case settingMax(minValue: Double?)
}

// Object that will handle all the navigation
@Observable
class NavigationCoordinator {
    var paths = NavigationPath()

    var setting = Setting()
    
    @ViewBuilder
     func navigate(to screen: Screens) -> some View {
        switch screen {
        case .home:
            HomeView(hartRateHelper: HartRateHelper())
        case .settingMin:
            SettingsView(sliderValue: Double(self.setting.min))
        case .settingMax(let min):
            SettingsView(isSetMin: false, min: min, sliderValue: Double(self.setting.max))
        }
    }

    // add screen
    func push(_ screen: Screens) {
        paths.append(screen)
    }

    // remove last screen
    func pop() {
        paths.removeLast()
    }

    // go to root screen
    func popToRoot() {
        paths.removeLast(paths.count)
    }
}
