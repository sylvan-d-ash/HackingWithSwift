//
//  ContentView.swift
//  HackingWithSwift-SwiftUISeries
//
//  Created by Sylvan  on 30/04/2025.
//

import SwiftUI
import WeSplit

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("WeSplit") {
                    WeSplitView()
                }
            }
            .navigationTitle("Hacking With Swift")
        }
    }
}

#Preview {
    ContentView()
}
