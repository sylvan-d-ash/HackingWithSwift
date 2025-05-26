//
//  HWSNavigationView.swift
//  HWSNavigation
//
//  Created by Sylvan  on 26/05/2025.
//

import SwiftUI

public struct HWSNavigationView: View {
    public init() {}

    public var body: some View {
        NavigationStack {
            List(0..<100) { i in
                NavigationLink("Select \(i)", value: i)
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    HWSNavigationView()
}
