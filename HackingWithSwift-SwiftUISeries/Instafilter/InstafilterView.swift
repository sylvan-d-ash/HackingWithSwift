//
//  InstafilterView.swift
//  Instafilter
//
//  Created by Sylvan  on 02/06/2025.
//

import SwiftUI

public struct InstafilterView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity: Double = 0.5

    public init() {}

    public var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                if let processedImage {
                    processedImage
                        .resizable()
                        .scaledToFit()
                } else {
                    ContentUnavailableView("No picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                }

                Spacer()

                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity, in: 0...1)
                }
                .padding(.vertical)

                HStack {
                    Button("Change Filter", action: changeFilter)

                    Spacer()

                    // share pic
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
        }
    }

    private func changeFilter() {
        //
    }
}
