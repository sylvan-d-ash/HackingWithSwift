//
//  View.swift
//  Flashzilla
//
//  Created by Sylvan  on 24/06/2025.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(y: offset * 5)
    }
}
