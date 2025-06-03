//
//  BucketlistView-ViewModel.swift
//  Bucketlist
//
//  Created by Sylvan  on 03/06/2025.
//

import Foundation
import CoreLocation
import LocalAuthentication

extension BucketlistView {
    @Observable
    final class ViewModel {
        private let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")

        private(set) var locations: [Location]
        var selectedPlace: Location?
        var isUnlocked = false

        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }

        func authenticate() {
            let context = LAContext()
            var error: NSError?

            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places."

                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authError in
                    if success {
                        self.isUnlocked = true
                    } else if let authError {
                        print("AuthError: \(authError.localizedDescription)")
                    }
                }
            } else {
                print("Biometrics not supported!")
            }
        }

        func addLocation(at coordinate: CLLocationCoordinate2D) {
            let location = Location(id: UUID(), name: "New location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
            locations.append(location)
            save()

            selectedPlace = location
        }

        func update(location: Location) {
            guard let selectedPlace else { return }

            guard let index = locations.firstIndex(of: selectedPlace) else { return }
            locations[index] = location
            save()
        }

        private func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data")
            }
        }
    }
}
