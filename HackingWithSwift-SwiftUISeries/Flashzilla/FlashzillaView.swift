//
//  FlashzillaView.swift
//  Flashzilla
//
//  Created by Sylvan  on 16/06/2025.
//

import SwiftUI

public struct FlashzillaView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.scenePhase) var scenePhase

    @State private var cards = Array<Card>(repeating: .example, count: 10)
    @State private var timeRemaining = 100
    @State private var isActive = true

    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    public init() {}

    public var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()

            VStack {
                Text("Time: \(timeRemaining)")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)

                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index]) {
                            withAnimation {
                                removeCard(at: index)
                            }
                        }
                            .stacked(at: index, in: cards.count)
                    }
                }
                .allowsHitTesting(timeRemaining > 0)
            }

            if differentiateWithoutColor {
                VStack {
                    Spacer()

                    HStack {
                        Image(systemName: "xmark.circle")
                            .padding()
                            .background(.black.opacity(0.7))
                            .clipShape(.circle)

                        Spacer()

                        Image(systemName: "checkmark.circle")
                            .padding()
                            .background(.black.opacity(0.7))
                            .clipShape(.circle)
                    }
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding()
                }
            }
        }
        .onReceive(timer) { time in
            guard isActive else { return }

            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .onChange(of: scenePhase) { _, _ in
            if scenePhase == .active {
                isActive = true
            } else {
                isActive = false
            }
        }
    }

    private func removeCard(at index: Int) {
        cards.remove(at: index)
    }
}

#Preview {
    FlashzillaView()
}
