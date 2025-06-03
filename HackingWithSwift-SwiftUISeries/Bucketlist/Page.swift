//
//  Page.swift
//  Bucketlist
//
//  Created by Sylvan  on 03/06/2025.
//

import Foundation

struct Results: Decodable {
    let query: QueryResults
}

struct QueryResults: Decodable {
    let pages: [Int: Page]
}

struct Page: Decodable, Comparable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?

    var description: String {
        terms?["description"]?.first ?? "No further information"
    }

    static func <(lhs: Page, rhs: Page) -> Bool {
        lhs.title < rhs.title
    }
}
