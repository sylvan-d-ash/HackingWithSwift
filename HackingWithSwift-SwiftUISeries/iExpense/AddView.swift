//
//  AddView.swift
//  iExpense
//
//  Created by Sylvan  on 19/05/2025.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
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

                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expense.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(expense: Expense())
}
