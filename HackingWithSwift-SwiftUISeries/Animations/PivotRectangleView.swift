//
//  PivotRectangleView.swift
//  Animations
//
//  Created by Sylvan  on 16/05/2025.
//

import SwiftUI

struct PivotRectangleView: View {
    @State private var isShowingRed = false

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)

            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

#Preview {
    PivotRectangleView()
}
