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
            }
            .navigationTitle("Hacking With Swift")
        }
    }
}

#Preview {
    ContentView()
}
