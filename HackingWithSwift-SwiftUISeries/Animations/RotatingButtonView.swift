//
//  RotatingButtonView.swift
//  Animations
//
//  Created by Sylvan  on 16/05/2025.
//

import SwiftUI

struct RotatingButtonView: View {
    @State private var animationAmount = 0.0

    var body: some View {
        Button("Tap Me") {
            withAnimation(.spring(duration: 1, bounce: 0.5)) {
                animationAmount += 360
            }
        }
        .padding(40)
        .background(.blue)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 0, z: 0))
    }
}

#Preview {
    RotatingButtonView()
}
