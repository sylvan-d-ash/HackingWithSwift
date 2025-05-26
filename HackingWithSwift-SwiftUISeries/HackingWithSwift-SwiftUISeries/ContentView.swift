//
//  ContentView.swift
//  HackingWithSwift-SwiftUISeries
//
//  Created by Sylvan  on 30/04/2025.
//

import SwiftUI
import WeSplit
import GuessTheFlag
import BetterRest
import WordScramble
import Animations
import iExpense
import Moonshot
import Navigation

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("WeSplit") {
                    WeSplitView()
                }
                NavigationLink("Guess The Flag") {
                    GuessTheFlagView()
                }
                NavigationLink("Better Rest") {
                    BetterRestView()
                }
                NavigationLink("Better Rest") {
                    WordScrambleView()
                }
                NavigationLink("Animations") {
                    AnimationsView()
                }
                NavigationLink("iExpense") {
                    iExpenseView()
                }
                NavigationLink("Moonshot") {
                    MoonshotView()
                }
                NavigationLink("Navigation") {
                    Navigation.ContentView()
                }
            }
            .navigationTitle("Hacking With Swift")
        }
    }
}

#Preview {
    ContentView()
}
