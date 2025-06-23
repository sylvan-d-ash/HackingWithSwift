//
//  RotationGestureView.swift
//  Flashzilla
//
//  Created by Sylvan  on 23/06/2025.
//

import SwiftUI

struct RotationGestureView: View {
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero

    var body: some View {
        Text("Hello Universe!")
            .contentShape(Rectangle())
            .frame(width: 200, height: 100)
            .background(.blue)
            .rotationEffect(currentAmount + finalAmount)
            .gesture(
                RotateGesture()
                    .onChanged { value in
                        currentAmount = value.rotation
                    }
                    .onEnded { value in
                        finalAmount = currentAmount
                        currentAmount = .zero
                    }
            )
    }
}


#Preview {
    RotationGestureView()
}
