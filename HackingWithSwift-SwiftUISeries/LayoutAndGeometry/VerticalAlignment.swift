//
//  VerticalAlignment.swift
//  LayoutAndGeometry
//
//  Created by Sylvan  on 24/06/2025.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }

    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}
