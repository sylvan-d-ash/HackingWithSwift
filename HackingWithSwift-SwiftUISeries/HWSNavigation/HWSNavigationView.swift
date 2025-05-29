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
            List {
                NavigationLink("Default Navigation with Destination") {
                    DefaultNavigationDestinationView()
                }
                NavigationLink("Programmatic Navigation") {
                    ProgrammaticNavigationView()
                }
                NavigationLink("Programmatic Navigation with NavigationPath") {
                    ProgrammaticNavigationPathView()
                }
                NavigationLink("Back To Home") {
                    BackToHomeView()
                }
                NavigationLink("Customizable Navigation Title") {
                    CustomizableNavigationTitleView()
                }
            }
            .navigationTitle("Navigation")
        }
    }
}

#Preview {
    HWSNavigationView()
}
