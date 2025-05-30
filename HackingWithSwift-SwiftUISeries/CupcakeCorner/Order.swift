//
//  Order.swift
//  CupcakeCorner
//
//  Created by Sylvan  on 30/05/2025.
//

import SwiftUI

@Observable
class Order {
    static let types = ["Vanilla", "Chocolate", "Red Velvet", "Carrot Cake", "Strawberry Shortcake", "Rainbow"]

    var type = 0
    var quantity = 3

    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
}
