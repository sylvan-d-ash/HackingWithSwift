//
//  StepperPlusButtonView.swift
//  Animations
//
//  Created by Sylvan  on 16/05/2025.
//

import SwiftUI

struct StepperPlusButtonView: View {
    @State private var animationAmount = 1.0

    var body: some View {
        print(animationAmount)
        return VStack {
            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)

            Spacer()

            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)

            Spacer()
        }
    }
}

#Preview {
    StepperPlusButtonView()
}
