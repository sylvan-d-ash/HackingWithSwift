//
//  Location.swift
//  Bucketlist
//
//  Created by Sylvan  on 03/06/2025.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable, Codable {
    var id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

extension Location {
    #if DEBUG
    static let example = Location(id: UUID(), name: "Mombasa", description: "Awesome coastal city", latitude: -4.1, longitude: 39.7)
    #endif

    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
