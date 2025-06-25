//
//  HStackGeometryView.swift
//  LayoutAndGeometry
//
//  Created by Sylvan  on 26/06/2025.
//

import SwiftUI

struct HStackGeometryView: View {
    var body: some View {
        HStack {
            Text("Hello universe!")
                .font(.largeTitle)
                .frame(width: 200)
                .background(.blue)

//            Image(.background)
//                .resizable()
//                .scaledToFit()
                // this doesn't play well in a h/vstack
//                .containerRelativeFrame(.horizontal) { size, axis in
//                    size * 0.8
//                }

            GeometryReader { proxy in
                Image(.background)
                    .resizable()
                    .scaledToFit()
                    // this positions the image at top right
                    .frame(width: proxy.size.width * 0.8)
                    // this positions it next to text
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
    }
}

#Preview {
    HStackGeometryView()
}
