//
//  PulsingButtonView.swift
//  Animations
//
//  Created by Sylvan  on 16/05/2025.
//

import SwiftUI

struct PulsingButtonView: View {
    @State private var animationAmount = 1.0

    var body: some View {
        Button("Tap me") {
            //animationAmount += 0.5
        }
        .padding(50)
        .background(.blue)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .overlay(
            Circle()
                .stroke(.blue)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                    .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
    }
}

#Preview {
    PulsingButtonView()
}
