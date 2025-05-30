//
//  CupcakeCornerView.swift
//  CupcakeCorner
//
//  Created by Sylvan  on 30/05/2025.
//

import SwiftUI

public struct CupcakeCornerView: View {
    @State private var order = Order()

    public init() {}
    
    public var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }

                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 1...10)
                }

                Section {
                    Toggle("Any special request?", isOn: $order.specialRequestEnabled)

                    if order.specialRequestEnabled {
                        Toggle("Add extra frostings?", isOn: $order.extraFrosting)

                        Toggle("Add extra sprinkles?", isOn: $order.addSprinkles)
                    }
                }

                Section {
                    NavigationLink("Delivery details") {
                        AddressView(order: order)
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    CupcakeCornerView()
}
