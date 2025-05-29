//
//  CustomizableNavigationTitleView.swift
//  HWSNavigation
//
//  Created by Sylvan  on 30/05/2025.
//

import SwiftUI

struct CustomizableNavigationTitleView: View {
    @State private var title = "SwiftUI"

    var body: some View {
        NavigationStack {
            Text("Hello universe!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CustomizableNavigationTitleView()
}
