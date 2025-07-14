//
//  SnowSeekerView.swift
//  SnowSeeker
//
//  Created by Sylvan  on 07/07/2025.
//

import SwiftUI

class SnowSeekerBundleLocator {}

public struct SnowSeekerView: View {
    @State private var searchText = ""
    private let resorts = Resort.allResorts

    private var filteredResorts: [Resort] {
        if searchText.isEmpty {
            resorts
        } else {
            resorts.filter { $0.name.localizedStandardContains(searchText) }
        }
    }

    public init() {}

    public var body: some View {
        NavigationSplitView {
            List(filteredResorts) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country, bundle: Bundle(for: SnowSeekerBundleLocator.self))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(.rect(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )

                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)

                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }

                        Spacer()

                        Image(systemName: "heart.fill")
                            .foregroundStyle(.red)
                            .accessibilityLabel("This is a favourite resort")
                    }
                }
            }
            .navigationTitle("Resorts")
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
            .searchable(text: $searchText, prompt: "Search for a resort")
        } detail: {
            WelcomeView()
        }
    }
}

#Preview {
    SnowSeekerView()
}
