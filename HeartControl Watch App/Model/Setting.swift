//
//  SettingModel.swift
//  HeartControl Watch App
//
//  Created by saeid on 7/6/24.
//

import Foundation

class Setting: ObservableObject {
    
    @Published var min: Int = 120
    @Published var max: Int = 160
}
