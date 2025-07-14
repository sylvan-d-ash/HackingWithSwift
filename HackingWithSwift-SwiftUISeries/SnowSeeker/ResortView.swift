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

private struct TooltipBubble: View {
    let title: String
    let message: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.headline)
                .bold()
            Text(message)
                .font(.body)
        }
        .padding()
        .background(.thinMaterial)
        .cornerRadius(10)
        .shadow(radius: 4)
    }
}

private struct FacilityView: View {
    let facility: Facility
    @Binding var selectedFacility: Facility?

    var body: some View {
        ZStack {
            Button {
                if selectedFacility == facility {
                    selectedFacility = nil
                } else {
                    selectedFacility = facility
                }
            } label: {
                facility.icon
                    .font(.title)
                    .frame(maxWidth: .infinity)
            }
//            .popover(isPresented: Binding(
//                get: { showingFacility && selectedFacility == facility },
//                set: { newValue in
//                    if !newValue {
//                        showingFacility = false
//                    }
//                }
//            )) {
//                VStack(alignment: .leading, spacing: 8) {
//                    Text(facility.name)
//                        .font(.headline)
//                        .bold()
//                    Text(facility.description)
//                        .font(.body)
//                }
//                .padding()
//                .frame(width: 200)
//            }

            if selectedFacility == facility {
                TooltipBubble(title: facility.name, message: facility.description)
                    .frame(maxWidth: 200)
                    .offset(y: -60) // position bubble above
                    .transition(.opacity.combined(with: .scale))
                    .zIndex(1)
            }
        }
    }
}

struct ResortView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(Favourites.self) var favourites

    @State private var selectedFacility: Facility?
    @State private var showingFacility = false

    let resort: Resort

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .topTrailing) {
                    Image(decorative: resort.id, bundle: Bundle(for: SnowSeekerBundleLocator.self))
                        .resizable()
                        .scaledToFit()
                        .overlay(
                            Text(resort.imageCredit)
                                .font(.caption)
                                .foregroundStyle(.white)
                                .padding(6)
                                .background(.black.opacity(0.5))
                                .clipShape(.capsule)
                                .padding([.bottom, .leading], 6),
                            alignment: .bottomLeading
                        )

                    Button {
                        if favourites.contains(resort) {
                            favourites.remove(resort)
                        } else {
                            favourites.add(resort)
                        }
                    } label: {
                        Image(systemName: favourites.contains(resort) ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .tint(.red)
                            .padding()
                            .accessibilityLabel("This is a favourite resort")
                    }
                }

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
                            Button {
                                selectedFacility = facility
                                showingFacility = true
                            } label: {
                                facility.icon
                                    .font(.title)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                    }
                    .padding(.vertical)
                }
            }
        }
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
        .alert(selectedFacility?.name ?? "More information", isPresented: $showingFacility, presenting: selectedFacility) { _ in
        } message: { facility in
            Text(facility.description)
        }
    }
}

#Preview {
    NavigationStack {
        ResortView(resort: .example)
            .environment(Favourites())
    }
}
