//
//  Resort.swift
//  SnowSeeker
//
//  Created by Sylvan  on 14/07/2025.
//

import Foundation

private class SnowSeekerBundleLocator {}

struct Resort: Codable, Hashable, Identifiable {
    let id: String
    let name: String
    let country: String
    let description: String
    let imageCredit: String
    let price: Int
    let size: Int
    let snowDepth: Int
    let elevation: Int
    let runs: Int
    let facilities: [String]

    static let allResorts: [Resort] = Bundle(for: SnowSeekerBundleLocator.self).decode("resorts.json")
    static let example = allResorts.first!
}
