//
//  AnimatedCardView.swift
//  Animations
//
//  Created by Sylvan  on 16/05/2025.
//

import SwiftUI

struct AnimatedCardView: View {
    @State private var enabled = false

    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .padding(40)
        .background(enabled ? .blue : .red)
        .animation(.default, value: enabled)
        .foregroundColor(.white)
        .clipShape(.rect(cornerRadius: enabled ? 80: 0))
        .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
    }
}

#Preview {
    AnimatedCardView()
}
