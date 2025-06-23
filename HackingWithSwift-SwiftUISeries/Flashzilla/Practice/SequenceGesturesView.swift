//
//  SequenceGesturesView.swift
//  Flashzilla
//
//  Created by Sylvan  on 23/06/2025.
//

import SwiftUI

struct SequenceGesturesView: View {
    @State private var offset = CGSize.zero
    @State private var isDragging = false

    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in offset = value.translation }
            .onEnded { _ in
                offset = .zero
                isDragging = false
            }

        let longPressGesture = LongPressGesture()
            .onEnded { _ in
                withAnimation {
                    isDragging = true
                }
            }

        let combinedGestures = longPressGesture.sequenced(before: dragGesture)

        Circle()
            .fill(.mint)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combinedGestures)
    }
}

#Preview {
    SequenceGesturesView()
}
