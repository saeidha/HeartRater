//
//  HomeView.swift
//  HeartControl Watch App
//
//  Created by saeid on 7/6/24.
//


import SwiftUI

struct HomeView: View {
    
    var hartRateHelper: HartRateHelper
    @Environment(NavigationCoordinator.self) var coordinator: NavigationCoordinator
    
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                HStack{
                    withAnimation{
                        ( Text("Low: ") + Text("\(coordinator.setting.min)")
                            .foregroundStyle(.green))
                        .font(.system(size: self.hartRateHelper.isStart ? 18 : 14))
                        .bold()
                        .opacity(0.8)
                    }
                    Spacer()
                    withAnimation{
                        (Text("High: ") + Text("\(coordinator.setting.max)").foregroundStyle(.red)) .font(.system(size: self.hartRateHelper.isStart ? 18 : 14))
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
                    
                    Button {
                        coordinator.push(.settingMin)
                    } label: {
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
    
    HomeView(hartRateHelper: HartRateHelper()).environment(NavigationCoordinator())
}
