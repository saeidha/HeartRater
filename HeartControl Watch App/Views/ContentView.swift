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
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                        HStack{
                            withAnimation{
                                ( Text("Low: ") + Text("\(setting.min)")
                                    .foregroundStyle(.green))
                                    .font(.system(size: self.hartRateHelper.isStart ? 18 : 14))
                                    .bold()
                                    .opacity(0.8)
                            }
                            Spacer()
                            withAnimation{
                                (Text("High: ") + Text("\(setting.max)").foregroundStyle(.red)) .font(.system(size: self.hartRateHelper.isStart ? 18 : 14))
                                    .bold()
                                    .opacity(0.8)
                            }
                        }.padding([.top] , self.hartRateHelper.isStart ? 0 : 15)
                Spacer()
                HStack(alignment: .center, spacing: 10) {
                    
                    withAnimation{
                        Text( !self.hartRateHelper.isStart ? "0" : "\(self.hartRateHelper.value)")
                            .contentTransition(.numericText(value: Double(self.hartRateHelper.value)))
                            .font(.largeTitle)
                            .bold()
                    }
                    if self.hartRateHelper.isStart {
                        HeartRateView()
                    }
                }
                
                Button {
                    if !self.hartRateHelper.isStart{
                        
                        self.hartRateHelper.start()
                    }else{
                        self.hartRateHelper.stop()
                    }
                } label: {
                    Text(self.hartRateHelper.isStart ? "Stop" : "Start")
                }
                
                
                
                if !self.hartRateHelper.isStart {
                    
                    NavigationLink(destination: SettingsView(sliderValue: Double(self.setting.min))) {
                        Text("Settings")
                            .padding()
                    }
                }
                //                    .sensoryFeedback(.impact(weight: .heavy, intensity: 0.9), trigger: self.hartRateHelper.alertHigh)
                //
                //                    .sensoryFeedback(.error, trigger: self.hartRateHelper.alertLow)
                
                //            HStack {
                //                Button{
                //                    self.hartRateHelper.alertLow = !self.hartRateHelper.alertLow
                //                } label: {
                //                    Text("Low")
                //                }
                //                Button{
                //                    self.hartRateHelper.alertHigh = !self.hartRateHelper.alertHigh
                //                } label: {
                //                    Text("High")
                //                }
                //            }
            }
            
        }
        
    }
}

#Preview {
    ContentView(hartRateHelper: HartRateHelper()).environmentObject(Setting())
}
