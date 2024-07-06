//
//  ContentView.swift
//  HeartControl Watch App
//
//  Created by saeid on 7/5/24.
//

import SwiftUI

struct ContentView: View {
    
    var hartRateHelper: HartRateHelper
    @EnvironmentObject var setting: Setting

    @State private var coordinator = NavigationCoordinator()

        var body: some View {
            NavigationStack(path: $coordinator.paths) {
                // Initially show screen1
                coordinator.navigate(to: .home)
                // navigate depending on the screen added to paths property in the coordinator
                    .navigationDestination(for: Screens.self) { screen in
                        coordinator.navigate(to: screen)
                    }
            }
            // inject object into environment so there is no need to pass to each view
            .environment(coordinator)
        }
}

#Preview {
    ContentView(hartRateHelper: HartRateHelper()).environmentObject(Setting())
}
