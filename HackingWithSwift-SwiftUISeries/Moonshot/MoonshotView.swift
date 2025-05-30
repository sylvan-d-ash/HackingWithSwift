//
//  MoonshotView.swift
//  Moonshot
//
//  Created by Sylvan  on 19/05/2025.
//

import SwiftUI

final class MoonshotBundleLocator {}

struct ImageView: View {
    let name: String

    var body: some View {
        Image(name, bundle: Bundle(for: MoonshotBundleLocator.self))
            .resizable()
    }
}

private struct GridLayoutView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]

    private let columns = [
        GridItem(.adaptive(minimum: 150), spacing: 15)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        VStack {
                            ImageView(name: mission.image)
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()

                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)

                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

private struct ListLayoutView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]

    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink(
                    destination: MissionView(mission: mission, astronauts: astronauts)
                ) {
                    HStack(spacing: 20) {
                        ImageView(name: mission.image)
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .alignmentGuide(.listRowSeparatorLeading) { d in d[.leading] }

                        VStack(alignment: .leading) {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)

                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                    }
                }
                .listRowBackground(Color.darkBackground)
            }
        }
        .listStyle(.plain)
    }
}

public struct MoonshotView: View {
    @State private var isShowingGrid = true

    private let astronauts: [String: Astronaut] = Bundle(for: MoonshotBundleLocator.self).decode("astronauts.json")
    private let missions: [Mission] = Bundle(for: MoonshotBundleLocator.self).decode("missions.json")

    private let columns = [
        GridItem(.adaptive(minimum: 150), spacing: 15)
    ]

    public init() {}

    public var body: some View {
        NavigationStack {
            Group {
                if isShowingGrid {
                    GridLayoutView(missions: missions, astronauts: astronauts)
                } else {
                    ListLayoutView(missions: missions, astronauts: astronauts)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button(isShowingGrid ? "List Layout" : "Grid Layout") {
                    isShowingGrid.toggle()
                }
            }
        }
    }
}

#Preview {
    MoonshotView()
}
