//
//  Setting.swift
//  HeartControl Watch App
//
//  Created by saeid on 7/6/24.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var setting: Setting
    @State var isSetMin: Bool = true
    @State var min: Double?
    @State var sliderValue: Double
    
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
                
                Slider(value: $sliderValue, in: (self.isSetMin ? 100...160 : ((min ?? 130) + 1)...200), step: 5)
                    .padding([.bottom, .leading, .trailing], 5)
                    .accentColor(self.isSetMin ? .green : .red)
                
                
                if isSetMin {
                    NavigationLink(destination: SettingsView(isSetMin: false, min: sliderValue, sliderValue: Double(self.setting.max))){
                        
                        Text("Next")
                    }
                    
                }else{
                    
                    Button {
                        
                        setting.min = Int(self.min ?? 0)
                        setting.max = Int(sliderValue)
                        
                    } label: {
                        
                        Text("Save")
                    }
                }
                
            }
        }
        
    }
}

#Preview {
    SettingsView(isSetMin: true, sliderValue: Double(120)).environmentObject(Setting())
}
