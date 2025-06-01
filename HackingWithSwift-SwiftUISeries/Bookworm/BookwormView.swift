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
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)

                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)

                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add New Book", systemImage: "plus") {
                        showingAddBookSheet = true
                    }
                }

                ToolbarItem(placement: .primaryAction) {
                    Button("Generate") {
                        let book = Book(title: "Hello, World!", author: "Sylvan", genre: "Poetry", review: "This is an example book.", rating: 4)
                        modelContext.insert(book)
                    }
                }
            }
            .sheet(isPresented: $showingAddBookSheet) {
                AddBookView()
            }
            .navigationDestination(for: Book.self) { book in
                DetailsView(book: book)
            }
        }
    }
}

#Preview {
    BookwormView()
        .modelContainer(BookwormSwiftDataManager.previewContainer())
}
