//
//  CupcakeCornerView.swift
//  CupcakeCorner
//
//  Created by Sylvan  on 30/05/2025.
//

import SwiftUI

public struct CupcakeCornerView: View {
    public init() {}
    
    public var body: some View {
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("Error loading image")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    CupcakeCornerView()
}
