//
//  Favourites.swift
//  SnowSeeker
//
//  Created by Sylvan  on 14/07/2025.
//

import SwiftUI

@Observable
final class Favourites {
    private var resorts: Set<Resort> = []
    private let key = "Favourites"

    init() {
        if let savedData = UserDefaults.standard.data(forKey: key) {
            if let decoded = try? JSONDecoder().decode([Resort].self, from: savedData) {
                resorts = Set(decoded)
                return
            }
        }

        resorts = []
    }

    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort)
    }

    func add(_ resort: Resort) {
        resorts.insert(resort)
        save()
    }

    func remove(_ resort: Resort) {
        resorts.remove(resort)
        save()
    }

    func save() {
        if let encoded = try? JSONEncoder().encode(resorts) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
}
