//
//  Item.swift
//  WeSplit
//
//  Created by Sylvan  on 30/04/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
