//
//  iExpenseView.swift
//  iExpense
//
//  Created by Sylvan  on 18/05/2025.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    let id: UUID = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
final class Expense {
    var items: [ExpenseItem] = []
}

public struct iExpenseView: View {
    public init() {}

    @State private var expense = Expense()
    @State private var isAddSheetPresented: Bool = false

    public var body: some View {
        List {
            ForEach(expense.items) { item in
                Text(item.name)
            }
            .onDelete(perform: remoteItem)
        }
        .navigationTitle("iExpense")
        .sheet(isPresented: $isAddSheetPresented) {
            AddView(expense: expense)
        }
        .toolbar {
            Button("Add Expense", systemImage: "+") {
                isAddSheetPresented = true
            }
        }
    }

    private func remoteItem(at offsets: IndexSet) {
        expense.items.remove(atOffsets: offsets)
    }
}

#Preview {
    NavigationStack {
        iExpenseView()
    }
}
