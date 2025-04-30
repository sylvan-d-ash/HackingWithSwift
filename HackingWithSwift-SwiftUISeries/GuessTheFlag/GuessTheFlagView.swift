//
//  GuessTheFlagView.swift
//  GuessTheFlag
//
//  Created by Sylvan  on 30/04/2025.
//

import SwiftUI

private final class GuessTheFlagBundleLocator {}

public struct GuessTheFlagView: View {
    public init() {}

    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

    public var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()

            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of: ")
                    Text(countries[correctAnswer])
                }
                .foregroundStyle(Color.white)

                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number], bundle: Bundle(for: GuessTheFlagBundleLocator.self))
                    }
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is: \(scoreTitle)")
        }
    }

    private func flagTapped(_ number: Int) {
        scoreTitle = number == correctAnswer ? "Correct" : "Wrong"

        showingScore = true
    }

    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    GuessTheFlagView()
}
