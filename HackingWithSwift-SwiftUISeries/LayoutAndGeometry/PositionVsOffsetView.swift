//
//  PositionVsOffsetView.swift
//  LayoutAndGeometry
//
//  Created by Sylvan  on 25/06/2025.
//

import SwiftUI

struct PositionVsOffsetView: View {
    var body: some View {
        Text("Hello Universe!")
            .background(.blue)
            .position(x: 100, y: 100)
    }
}

#Preview {
    PositionVsOffsetView()
}

struct OffsetView: View {
    var body: some View {
        Text("Hello Universe!")
            .offset(x: 100, y: 100)
            .background(.blue)
            //.clipShape(.capsule)
    }
}

#Preview {
    OffsetView()
}
