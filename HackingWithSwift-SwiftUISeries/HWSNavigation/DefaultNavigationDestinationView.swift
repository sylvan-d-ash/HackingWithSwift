//
//  DefaultNavigationDestinationView.swift
//  HWSNavigation
//
//  Created by Sylvan  on 26/05/2025.
//

import SwiftUI

struct DefaultNavigationDestinationView: View {
    var body: some View {
        List(0..<100) { i in
            NavigationLink("Select \(i)", value: i)
        }
        .navigationDestination(for: Int.self) { selection in
            Text("You selected: \(selection)")
        }
    }
}

#Preview {
    NavigationStack {
        DefaultNavigationDestinationView()
    }
}
