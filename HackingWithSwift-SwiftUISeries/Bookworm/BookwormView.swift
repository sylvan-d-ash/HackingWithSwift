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

    @Query(sort: [
        SortDescriptor(\Book.rating, order: .reverse),
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author),
    ]) var books: [Book]

    @State private var showingAddBookSheet = false

    public init() {}

    public var body: some View {
        NavigationStack {
            List {
                if books.isEmpty {
                    ContentUnavailableView {
                        Label("No books!", systemImage: "book")
                    } description: {
                        Text("You haven't added any books yet")
                    } actions: {
                        Button("Add New Book") { showingAddBookSheet = true }
                            .buttonStyle(.bordered)

                        Button("Autogenerate Book") {
                            let book = Book(title: "Hello, Universe!", author: "Winter", genre: "Fantasy", review: "This is the worst book ever!", rating: 1)
                            modelContext.insert(book)
                        }
                        .buttonStyle(.bordered)
                    }
                    .buttonStyle(.plain)
                }

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
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add New Book", systemImage: "plus") {
                        showingAddBookSheet = true
                    }
                }

                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
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

    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let bookToDelete = books[offset]
            modelContext.delete(bookToDelete)
        }
    }
}

#Preview {
    BookwormView()
        .modelContainer(BookwormSwiftDataManager.previewContainer())
}
