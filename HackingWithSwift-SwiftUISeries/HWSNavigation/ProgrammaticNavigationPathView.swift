//
//  ProgrammaticNavigationPathView.swift
//  HWSNavigation
//
//  Created by Sylvan  on 26/05/2025.
//

import SwiftUI

struct ProgrammaticNavigationPathView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select Number: \(i)", value: i)
                }

                ForEach(0..<5) { i in
                    NavigationLink("Select String: \(i)", value: String(i))
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number: \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string: \(selection)")
            }
            .toolbar {
                Button("Push 444") {
                    path.append(444)
                }

                Button("Push 'Hello'") {
                    path.append("Hello")
                }
            }
        }
    }
}

#Preview {
    ProgrammaticNavigationPathView()
}
