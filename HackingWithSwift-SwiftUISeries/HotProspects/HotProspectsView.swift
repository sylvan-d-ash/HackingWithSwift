//
//  HotProspectsView.swift
//  HotProspects
//
//  Created by Sylvan  on 11/06/2025.
//

import SwiftUI

public struct HotProspectsView: View {
    public init() {}

    public var body: some View {
        TabView {
            ProspectsView()
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            ProspectsView()
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }
            ProspectsView()
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            MeView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                }
        }
    }
}

#Preview {
    HotProspectsView()
}
