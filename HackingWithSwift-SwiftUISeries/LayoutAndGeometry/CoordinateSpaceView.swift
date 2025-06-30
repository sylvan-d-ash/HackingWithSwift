//
//  CoordinateSpaceView.swift
//  LayoutAndGeometry
//
//  Created by Sylvan  on 30/06/2025.
//

import SwiftUI

/**
 Which coordinate space you want to use depends on what question you want to answer:

 Want to know where this view is on the screen? Use the global space.
 Want to know where this view is relative to its parent? Use the local space.
 What to know where this view is relative to some other view? Use a custom space.
 */

private struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")

            GeometryReader { geometry in
                Text("Center")
                    .background(.blue)
                    .onTapGesture {
                        print("Global center: \(geometry.frame(in: .global).midX) x  \(geometry.frame(in: .global).midY)")
                        print("Custom center: \(geometry.frame(in: .named("Custom")).midX) x  \(geometry.frame(in: .named("Custom")).maxY)")
                        print("Local center: \(geometry.frame(in: .local).midX) x  \(geometry.frame(in: .local).midY)")
                    }
            }
            .background(.orange)

            Text("Right")
        }
    }
}

private struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")

            InnerView()
                .background(.green)

            Text("Bottom")
        }
    }
}

struct CoordinateSpaceView: View {
    var body: some View {
        OuterView()
            .background(.red)
            .coordinateSpace(name: "Custom")
    }
}

#Preview {
    CoordinateSpaceView()
}
