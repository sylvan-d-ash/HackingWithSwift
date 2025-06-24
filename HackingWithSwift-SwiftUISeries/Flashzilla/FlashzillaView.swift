//
//  FlashzillaView.swift
//  Flashzilla
//
//  Created by Sylvan  on 16/06/2025.
//

import SwiftUI

public struct FlashzillaView: View {
    @State private var cards = Array<Card>(repeating: .example, count: 10)
    
    public init() {}

    public var body: some View {
        Text("Hello universe")
    }
}

#Preview {
    FlashzillaView()
}
