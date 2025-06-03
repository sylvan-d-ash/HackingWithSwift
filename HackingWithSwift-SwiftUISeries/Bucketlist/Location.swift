//
//  Location.swift
//  Bucketlist
//
//  Created by Sylvan  on 03/06/2025.
//

import Foundation

struct Location: Identifiable, Equatable, Codable {
    let id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
}
