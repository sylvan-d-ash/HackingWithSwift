//
//  MissionView.swift
//  Moonshot
//
//  Created by Sylvan  on 23/05/2025.
//

import SwiftUI

private struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

private struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

private struct CrewMembersView: View {
    let crew: [CrewMember]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            ImageView(name: crewMember.astronaut.id)
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )

                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)

                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct MissionView: View {
    let mission: Mission
    private let crew: [CrewMember]

    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("MIssing \(member.name)")
            }
        }
    }

    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image, bundle: Bundle(for: MoonshotBundleLocator.self))
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, _ in
                        width * 0.6
                    }
                    .padding(.top)
                    .accessibilityHidden(true)

                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .padding()

                VStack(spacing: 0) {
                    CustomDivider()

                    HStack {
                        Text("Crew")
                            .font(.title.bold())

                        Spacer()
                    }
                }
                .padding(.horizontal)

                CrewMembersView(crew: crew)

                VStack(alignment: .leading, spacing: 0) {
                    CustomDivider()

                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom)

                    Text(mission.description)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

#Preview {
    let missions: [Mission] = Bundle(for: MoonshotBundleLocator.self).decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle(for: MoonshotBundleLocator.self).decode("astronauts.json")
    NavigationStack {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
