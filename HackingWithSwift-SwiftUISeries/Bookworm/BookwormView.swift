//
//  BookwormView.swift
//  Bookworm
//
//  Created by Sylvan  on 30/05/2025.
//

import SwiftUI
import SwiftData

public struct BookwormView: View {
    @Environment(\.modelContext) var modelContext

    @Query var books: [Book]

    @State private var showingAddBookSheet = false

    public init() {}

    public var body: some View {
        NavigationStack {
            Text("Count: \(books.count)")
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add New Book", systemImage: "plus") {
                            showingAddBookSheet = true
                        }
                    }
                }
                .sheet(isPresented: $showingAddBookSheet) {
                    AddBookView()
                }
        }
    }
}

#Preview {
    BookwormView()
}
