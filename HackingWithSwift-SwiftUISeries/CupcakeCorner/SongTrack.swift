//
//  SongTrack.swift
//  CupcakeCorner
//
//  Created by Sylvan  on 30/05/2025.
//

import Foundation

struct Response: Decodable {
    var tracks: [SongTrack]
}

struct SongTrack: Decodable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
