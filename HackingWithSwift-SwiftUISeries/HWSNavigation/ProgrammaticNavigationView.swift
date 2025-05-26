//
//  ProgrammaticNavigationView.swift
//  HWSNavigation
//
//  Created by Sylvan  on 26/05/2025.
//

import SwiftUI

struct ProgrammaticNavigationView: View {
    @State private var path = [Int]()

    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 20) {
                Button("Show 188") {
                    path = [188]
                }

                Button("Show 64") {
                    path.append(64)
                }

                Button("Show 32 and 44") {
                    path = [32, 44]
                }

                Spacer()
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    ProgrammaticNavigationView()
}
