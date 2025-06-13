//
//  ContextMenuView.swift
//  HotProspects
//
//  Created by Sylvan  on 12/06/2025.
//

import SwiftUI

struct ContextMenuView: View {
    @State private var backgroundColour: Color = .blue

    var body: some View {
        VStack {
            Text("Hello universe")
                .padding()
                .background(backgroundColour)

            Text("Change colour")
                .padding()
                .contextMenu {
                    Button("Red") {
                        backgroundColour = .red
                    }

                    Button("Green") {
                        backgroundColour = .green
                    }

                    Button("Blue") {
                        backgroundColour = .blue
                    }
                }
        }
    }
}

#Preview {
    ContextMenuView()
}
