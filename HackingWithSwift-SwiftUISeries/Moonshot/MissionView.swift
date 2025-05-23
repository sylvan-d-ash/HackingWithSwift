//
//  MissionView.swift
//  Moonshot
//
//  Created by Sylvan  on 23/05/2025.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission

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

                VStack(alignment: .leading) {
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)

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
    NavigationStack {
        MissionView(mission: missions[0])
            .preferredColorScheme(.dark)
    }
}
