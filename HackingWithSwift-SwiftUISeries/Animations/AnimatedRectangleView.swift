//
//  AnimatedRectangleView.swift
//  Animations
//
//  Created by Sylvan  on 16/05/2025.
//

import SwiftUI

struct AnimatedRectangleView: View {
    @State private var isShowingRed = false

    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            .padding(40)
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(.circle)

            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

#Preview {
    AnimatedRectangleView()
}
