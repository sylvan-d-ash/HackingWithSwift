//
//  MultipleAnimationsView.swift
//  Animations
//
//  Created by Sylvan  on 16/05/2025.
//

import SwiftUI

struct MultipleAnimationsView: View {
    @State private var dragAmount = CGSize.zero

    var body: some View {
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        withAnimation {
                            dragAmount = .zero
                        }
                    }
            )
    }
}

#Preview {
    MultipleAnimationsView()
}
