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
                    Button("Send message", systemImage: "message") {
                        print("hi")
                    }
                }
        }
    }
}

#Preview {
    SwipeActionsView()
}
