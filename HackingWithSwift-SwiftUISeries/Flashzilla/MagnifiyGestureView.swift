//
//  MagnifiyGestureView.swift
//  Flashzilla
//
//  Created by Sylvan  on 23/06/2025.
//

import SwiftUI

struct MagnifiyGestureView: View {
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0

    var body: some View {
        Text("Hello Universe!")
            .contentShape(Rectangle())
            .background(.blue)
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                MagnifyGesture()
                    .onChanged { value in
                        currentAmount = value.magnification - 1
                    }
                    .onEnded { value in
                        finalAmount += currentAmount
                        currentAmount = 0
                    }
            )
    }
}

#Preview {
    MagnifiyGestureView()
}
