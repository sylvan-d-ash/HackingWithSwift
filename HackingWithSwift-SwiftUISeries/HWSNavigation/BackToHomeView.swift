//
//  BackToHomeView.swift
//  HWSNavigation
//
//  Created by Sylvan  on 29/05/2025.
//

import SwiftUI

private struct DetailsView: View {
    var number: Int
    @Binding var path: [Int]

    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 0...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path.removeAll()
                }
            }
    }
}

struct BackToHomeView: View {
    @State private var path = [Int]()

    var body: some View {
        NavigationStack(path: $path) {
            DetailsView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailsView(number: i, path: $path)
                }
        }
    }
}

#Preview {
    BackToHomeView()
}
