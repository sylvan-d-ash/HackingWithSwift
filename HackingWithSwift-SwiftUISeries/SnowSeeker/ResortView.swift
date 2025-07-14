//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Sylvan  on 14/07/2025.
//

import SwiftUI

private struct DetailSectionView: View {
    let title: String
    let value: String

    var body: some View {
        VStack {
            Text(title)
                .font(.caption.bold())

            Text(value)
                .font(.title3)
        }
    }
}

private struct ResortDetailsView: View {
    let resort: Resort

    private var size: String {
        switch resort.size {
        case 1: "Small"
        case 2: "Average"
        default: "Large"
        }
    }

    private var price: String {
        String(repeating: "$", count: resort.price)
    }

    var body: some View {
        Group {
            DetailSectionView(title: "Size", value: size)
            DetailSectionView(title: "Price", value: price)
        }
        .frame(maxWidth: .infinity)
    }
}

private struct SkiDetailsView: View {
    let resort: Resort

    var body: some View {
        Group {
            DetailSectionView(title: "Elevation", value: "\(resort.elevation)m")
            DetailSectionView(title: "Snow", value: "\(resort.snowDepth)cm")
        }
        .frame(maxWidth: .infinity)
    }
}

struct ResortView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.dynamicTypeSize) var dynamicTypeSize

    let resort: Resort

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(decorative: resort.id, bundle: Bundle(for: SnowSeekerBundleLocator.self))
                    .resizable()
                    .scaledToFit()

                HStack {
                    if horizontalSizeClass == .compact, dynamicTypeSize > .large {
                        VStack(spacing: 10) { ResortDetailsView(resort: resort) }
                        VStack(spacing: 10) { SkiDetailsView(resort: resort) }
                    } else {
                        ResortDetailsView(resort: resort)
                        SkiDetailsView(resort: resort)
                    }
                }
                .padding(.vertical)
                .background(.primary.opacity(0.1))

                Group {
                    Text(resort.description)
                        .padding(.vertical)

                    Text("Facilities")
                        .font(.headline)

                    HStack {
                        ForEach(resort.facilityTypes) { facility in
                            facility.icon
                                .font(.title)
                                .frame(maxWidth: .infinity)
                        }
                    }
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
