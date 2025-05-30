//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Sylvan  on 30/05/2025.
//

import SwiftUI

struct CheckoutView: View {
    @Bindable var order: Order

    var body: some View {
        Text("Hello universe!")
    }
}

#Preview {
    CheckoutView(order: Order())
}
