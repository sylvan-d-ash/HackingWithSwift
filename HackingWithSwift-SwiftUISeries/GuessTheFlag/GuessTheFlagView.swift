//
//  GuessTheFlagView.swift
//  GuessTheFlag
//
//  Created by Sylvan  on 30/04/2025.
//

import SwiftUI

public struct GuessTheFlagView: View {
    public init() {}

    public var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }

            AngularGradient(colors: [.red, .yellow, .green, .blue], center: .center)

            Text("Hello universe!")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    GuessTheFlagView()
}
