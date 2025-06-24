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
                Image(.background)
                    .resizable()
                    .frame(width: 64, height: 64)
                    .clipShape(.circle)
            }

            VStack {
                Text("Full Name")
                Text("Awesome Dev")
                    .font(.largeTitle)
                    .textCase(.uppercase)
            }
        }
    }
}

#Preview {
    CustomAlignmentView()
}
