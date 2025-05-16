//
//  Animations.swift
//  Animations
//
//  Created by Sylvan  on 16/05/2025.
//

import SwiftUI

public struct AnimationsView: View {
    public init() {}

    public var body: some View {
        NavigationStack {
            List {
                NavigationLink("Animated Card") {
                    AnimatedCardView()
                }
                NavigationLink("Animated Letters") {
                    AnimatedLettersView()
                }
                NavigationLink("Animated Rectangle") {
                    AnimatedRectangleView()
                }
                NavigationLink("Multiple Animations") {
                    MultipleAnimationsView()
                }
                NavigationLink("Pivot Rectangle") {
                    PivotRectangleView()
                }
                NavigationLink("Pulsing Button") {
                    PulsingButtonView()
                }
                NavigationLink("Rotating Button") {
                    RotatingButtonView()
                }
                NavigationLink("Stepper And Button") {
                    StepperPlusButtonView()
                }
            }
            .navigationTitle("Animations")
        }
    }
}

#Preview {
    AnimationsView()
}
