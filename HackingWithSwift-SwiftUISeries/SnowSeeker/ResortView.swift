//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Sylvan  on 14/07/2025.
//

import SwiftUI

struct ResortView: View {
    let resort: Resort

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(decorative: resort.id, bundle: Bundle(for: SnowSeekerBundleLocator.self))
                    .resizable()
                    .scaledToFit()

                Group {
                    Text(resort.description)
                        .padding(.vertical)

                    Text("Facilities")
                        .font(.headline)

                    Text(resort.facilities.joined(separator: ", "))
                        .padding(.vertical)
                }
            }
        }
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ResortView(resort: .example)
    }
}
