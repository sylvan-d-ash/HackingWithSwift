//
//  FlashzillaView.swift
//  Flashzilla
//
//  Created by Sylvan  on 16/06/2025.
//

import SwiftUI

private class FlashzillaBundleLocator {}

public struct FlashzillaView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
    @Environment(\.scenePhase) var scenePhase

    @State private var cards = [Card]()
    @State private var timeRemaining = 0
    @State private var isActive = true
    @State private var showingEditScreen = false

    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    public init() {}

    public var body: some View {
        ZStack {
            Image(decorative: "background", bundle: Bundle(for: FlashzillaBundleLocator.self))
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
                        .allowsHitTesting(index == cards.count - 1)
                        .accessibilityHidden(index < cards.count - 1)
                    }
                }
                .allowsHitTesting(timeRemaining > 0)

                if cards.isEmpty {
                    Button("Start Again", action: resetCards)
                        .padding()
                        .background(.white)
                        .foregroundStyle(.black)
                        .clipShape(.capsule)
                        .padding(.top)
                }
            }

            VStack {
                HStack {
                    Spacer()

                    Button {
                        showingEditScreen = true
                    } label: {
                        Image(systemName: "pencil.circle")
                            .padding()
                            .background(.black.opacity(0.7))
                            .clipShape(.circle)
                    }
                }

                Spacer()
            }
            .foregroundStyle(.white)
            .font(.largeTitle)
            .padding()
            .accessibilityElement()
            .accessibilityLabel("Edit Cards")

            if differentiateWithoutColor || voiceOverEnabled {
                VStack {
                    Spacer()

                    HStack {
                        Button {
                            withAnimation {
                                removeCard(at: cards.count - 1)
                            }
                        } label: {
                            Image(systemName: "xmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.circle)
                        }
                        .accessibilityLabel("Wrong")
                        .accessibilityHint("Mark you answer as being incorrect.")

                        Spacer()

                        Button {
                            withAnimation {
                                removeCard(at: cards.count - 1)
                            }
                        } label: {
                            Image(systemName: "checkmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.circle)
                        }
                        .accessibilityLabel("Correct")
                        .accessibilityHint("Mark you answer as being correct.")
                    }
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding()
                }
            }
        }
        .onAppear(perform: resetCards)
        .onReceive(timer) { time in
            guard isActive, !cards.isEmpty else { return }

            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .onChange(of: scenePhase) { _, _ in
            if scenePhase == .active {
                guard !cards.isEmpty else { return }
                isActive = true
            } else {
                isActive = false
            }
        }
        .sheet(
            isPresented: $showingEditScreen,
            onDismiss: resetCards,
            content: EditCardsView.init
        )
    }

    private func removeCard(at index: Int) {
        guard index >= 0 else { return }
        cards.remove(at: index)

        if cards.isEmpty {
            isActive = false
        }
    }

    private func resetCards() {
        timeRemaining = 100
        isActive = true
        loadData()
    }

    private func loadData() {
        guard let data = UserDefaults.standard.data(forKey: "Cards") else { return }
        guard let decoded = try? JSONDecoder().decode([Card].self, from: data) else { return }
        cards = decoded
    }
}

#Preview {
    FlashzillaView()
}
