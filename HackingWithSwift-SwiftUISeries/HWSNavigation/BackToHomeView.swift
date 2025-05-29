//
//  BackToHomeView.swift
//  HWSNavigation
//
//  Created by Sylvan  on 29/05/2025.
//

import SwiftUI

private struct DetailsView: View {
    var number: Int
    @Binding var path: NavigationPath

    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 0...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path = NavigationPath()
                }
            }
    }
}

struct BackToHomeView: View {
    @State private var pathStore = PathStore()

    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailsView(number: 0, path: $pathStore.path)
                .navigationDestination(for: Int.self) { i in
                    DetailsView(number: i, path: $pathStore.path)
                }
        }
    }
}

#Preview {
    BackToHomeView()
}
