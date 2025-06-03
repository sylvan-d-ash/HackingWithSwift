//
//  BucketlistView-ViewModel.swift
//  Bucketlist
//
//  Created by Sylvan  on 03/06/2025.
//

import Foundation
import CoreLocation

extension BucketlistView {
    @Observable
    final class ViewModel {
        private(set) var locations = [Location]()
        var selectedPlace: Location?

        func addLocation(at coordinate: CLLocationCoordinate2D) {
            let location = Location(id: UUID(), name: "New location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
            locations.append(location)

            selectedPlace = location
        }

        func update(location: Location) {
            guard let selectedPlace else { return }

            guard let index = locations.firstIndex(of: selectedPlace) else { return }
            locations[index] = location
        }
    }
}
