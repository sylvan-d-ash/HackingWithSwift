//
//  AddView.swift
//  iExpense
//
//  Created by Sylvan  on 19/05/2025.
//

import SwiftUI

struct AddView: View {
    @State private var name: String = ""
    @State private var type: String = ""
    @State private var amount: Double = 0
    var expense: Expense

    private let types = ["Business", "Personal"]

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name:", text: $name)

                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }

                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
        }
    }
}

#Preview {
    AddView(expense: Expense())
}
