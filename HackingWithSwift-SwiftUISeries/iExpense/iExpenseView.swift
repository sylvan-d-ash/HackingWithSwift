//
//  iExpenseView.swift
//  iExpense
//
//  Created by Sylvan  on 18/05/2025.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id: UUID = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
final class Expense {
    var items: [ExpenseItem] = [] {
        didSet {
            guard let data = try? JSONEncoder().encode(items) else { return }
            UserDefaults.standard.set(data, forKey: "Items")
        }
    }

    init() {
        if let data = UserDefaults.standard.data(forKey: "Items"), let items = try? JSONDecoder().decode([ExpenseItem].self, from: data) {
            self.items = items
            return
        }
        items = []
    }
}

public struct iExpenseView: View {
    public init() {}

    @State private var expense = Expense()
    @State private var isAddSheetPresented: Bool = false

    public var body: some View {
        List {
            ForEach(expense.items) { item in
                HStack {
                    VStack {
                        Text(item.name)
                        Text(item.type)
                    }

                    Spacer()

                    Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
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
