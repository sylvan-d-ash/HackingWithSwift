//
//  HackingWithSwift_SwiftUISeriesApp.swift
//  HackingWithSwift-SwiftUISeries
//
//  Created by Sylvan  on 30/04/2025.
//

import Bookworm
import HotProspects
import SwiftUI
import SwiftData

@main
struct HackingWithSwift_SwiftUISeriesApp: App {
    let modelContainer: ModelContainer = {
        do {
            let schema = Schema([Book.self, Prospect.self])
            let config = ModelConfiguration()
            return try ModelContainer(for: schema, configurations: [config])
        } catch {
            fatalError("Failed to initialize ModelContainer: \(error.localizedDescription)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(modelContainer)
    }
}
