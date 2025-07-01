//
//  CoverFlowView.swift
//  LayoutAndGeometry
//
//  Created by Sylvan  on 01/07/2025.
//

import SwiftUI

struct CoverFlowView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<20) { num in
                    GeometryReader { proxy in
                        Text("Number \(num)")
                            .font(.largeTitle)
                            .padding()
                            .background(.blue)
                            .rotation3DEffect(
                                .degrees(-proxy.frame(in: .global).midX) / 8,
                                axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(width: 200, height: 200)
                }
            }
        }
    }
}


struct CoverFlowVisualEffectsView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<20) { num in
                    Text("Number \(num)")
                        .font(.largeTitle)
                        .padding()
                        .background(.blue)
                        .frame(width: 200, height: 200)
                        .visualEffect { content, proxy in
                            content
                                .rotation3DEffect(
                                    .degrees(-proxy.frame(in: .global).midX) / 8,
                                    axis: (x: 0, y: 1, z: 0))
                        }
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    CoverFlowView()
}

#Preview {
    CoverFlowVisualEffectsView()
}
