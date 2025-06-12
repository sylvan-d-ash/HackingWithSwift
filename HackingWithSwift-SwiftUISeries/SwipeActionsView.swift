//
//  SwipeActionsView.swift
//  HotProspects
//
//  Created by Sylvan  on 12/06/2025.
//

import SwiftUI

struct SwipeActionsView: View {
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button("Delete", systemImage: "minus.circle", role: .destructive) {
                        print("Deleting...")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button("Pin", systemImage: "pin") {
                        print("Pinning...")
                    }
                    .tint(.orange)
                }
        }
    }
}

#Preview {
    SwipeActionsView()
}
