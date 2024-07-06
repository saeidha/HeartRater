//
//  HeartRateView.swift
//  HeartControl Watch App
//
//  Created by saeid on 7/6/24.
//

import SwiftUI

struct HeartRateView: View {
    
    @State private var isAnimating = false
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.title2)
            .foregroundStyle(.red)
            .frame(width: 50, height: 50)
            .scaleEffect(isAnimating ? 1.2 : 1)
            .animation(
                isAnimating ?
                    .easeInOut(duration: 1.5).repeatForever(autoreverses: true) :
                        .default,
                value: isAnimating
            )
            .onAppear {
                isAnimating = true
            }
    }
}

#Preview {
    HeartRateView()
}
