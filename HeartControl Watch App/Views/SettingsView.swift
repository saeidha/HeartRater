//
//  Setting.swift
//  HeartControl Watch App
//
//  Created by saeid on 7/6/24.
//

import SwiftUI

struct SettingsView: View {
    
    @State var isSetMin: Bool = true
    @State var min: Double?
    @State var sliderValue: Double
    @Environment(NavigationCoordinator.self) var coordinator: NavigationCoordinator
    var body: some View {
        
        
        ScrollView(.vertical) {
            VStack {
                
                Text("Set \(self.isSetMin ? "Min" : "Max") heart rate")
                    .font(.footnote)
                    .opacity(0.6)
                
                Text("\(Int(sliderValue))")
                    .font(.title)
                    .bold()
                    .padding(.top, 5)
                
                Slider(value: $sliderValue, in: (self.isSetMin ? 100...160 : ((min ?? 130))...200), step: 5)
                    .padding([.bottom, .leading, .trailing], 5)
                    .accentColor(self.isSetMin ? .green : .red)
                
                if isSetMin {
                    Button {
                        coordinator.push(.settingMax(minValue: $sliderValue.wrappedValue))
                    } label: {
                        Text("Next")
                    }
                }else{
                    Button {
                        coordinator.setting.min = Int(self.min ?? 0)
                        coordinator.setting.max = Int(sliderValue)
                        coordinator.popToRoot()
                    } label: {
                        
                        Text("Save")
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SettingsView(isSetMin: true, sliderValue: Double(120)).environment(NavigationCoordinator())
}
