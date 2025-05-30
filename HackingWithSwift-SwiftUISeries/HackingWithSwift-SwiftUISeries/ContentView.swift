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
import HWSNavigation
import CupcakeCorner
import Bookworm

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
                NavigationLink("Word Scamble") {
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
                    HWSNavigationView()
                }
                NavigationLink("Cupcake Corner") {
                    CupcakeCornerView()
                }
                NavigationLink("Bookworm") {
                    BookwormView()
                }
            }
            .navigationTitle("Hacking With Swift")
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
