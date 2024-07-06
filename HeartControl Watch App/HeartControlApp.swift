//
//  HeartControlApp.swift
//  HeartControl Watch App
//
//  Created by saeid on 7/5/24.
//

import SwiftUI

@main
struct HeartControl_Watch_AppApp: App {
    
    @StateObject var setting = Setting()
    var hartRateHelper = HartRateHelper()
    
    var body: some Scene {
        WindowGroup {
            ContentView(hartRateHelper: hartRateHelper)
                .environmentObject(setting)
        }
    }
}
