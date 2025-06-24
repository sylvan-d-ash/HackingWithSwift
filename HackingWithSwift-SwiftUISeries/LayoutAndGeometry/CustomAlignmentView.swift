//
//  CustomAlignmentView.swift
//  LayoutAndGeometry
//
//  Created by Sylvan  on 24/06/2025.
//

import SwiftUI

struct CustomAlignmentView: View {
    var body: some View {
        HStack {
            VStack {
                Text("@awesome_dev")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }

                Image(.background)
                    .resizable()
                    .frame(width: 64, height: 64)
                    .clipShape(.circle)
            }

            VStack {
                Text("Full Name")

                Text("AWESOME DEV")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    CustomAlignmentView()
}
