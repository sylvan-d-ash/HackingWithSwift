//
//  MoonshotView.swift
//  Moonshot
//
//  Created by Sylvan  on 19/05/2025.
//

import SwiftUI

private final class MoonshotBundleLocator {}

public struct MoonshotView: View {
    private let astronauts: [String: Astronaut] = Bundle(for: MoonshotBundleLocator.self).decode("astronauts.json")
    private let missions: [Mission] = Bundle(for: MoonshotBundleLocator.self).decode("missions.json")

    private let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    public init() {}

    public var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            Text("Detail View")
                        } label: {
                            VStack {
                                Image(mission.image, bundle: Bundle(for: MoonshotBundleLocator.self))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)

                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)

                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Moonshot")
        }
    }
}

#Preview {
    MoonshotView()
}
