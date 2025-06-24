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
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()

            VStack {
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index]) {
                            withAnimation {
                                removeCard(at: index)
                            }
                        }
                            .stacked(at: index, in: cards.count)
                    }
                }
            }
        }
    }

    private func removeCard(at index: Int) {
        cards.remove(at: index)
    }
}

#Preview {
    FlashzillaView()
}
