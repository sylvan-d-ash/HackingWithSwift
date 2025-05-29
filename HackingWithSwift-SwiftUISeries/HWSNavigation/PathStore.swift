//
//  PathStore.swift
//  HWSNavigation
//
//  Created by Sylvan  on 29/05/2025.
//

import SwiftUI

@Observable
final class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }

    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")

    init() {
        guard let data = try? Data(contentsOf: savePath),
                let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data)
        else {
            path = NavigationPath()
            return
        }

        path = NavigationPath(decoded)
    }

    private func save() {
        guard let representatoin = path.codable else { return }

        do {
            let data = try JSONEncoder().encode(representatoin)
            try data.write(to: savePath)
        } catch {
            print("Failed to save nav path: \(error.localizedDescription)")
        }
    }
}
