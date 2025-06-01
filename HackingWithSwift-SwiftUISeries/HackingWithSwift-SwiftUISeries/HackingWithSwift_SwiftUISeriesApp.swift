//
//  HackingWithSwift_SwiftUISeriesApp.swift
//  HackingWithSwift-SwiftUISeries
//
//  Created by Sylvan  on 30/04/2025.
//

import Bookworm
import SwiftUI
import SwiftData

@main
struct HackingWithSwift_SwiftUISeriesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(BookwormSwiftDataManager.shared)
    }
}
