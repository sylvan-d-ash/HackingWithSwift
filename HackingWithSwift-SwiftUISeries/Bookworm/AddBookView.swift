//
//  AddBookView.swift
//  Bookworm
//
//  Created by Sylvan  on 01/06/2025.
//

import SwiftUI
import SwiftData

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    @State private var title: String = ""
    @State private var author: String = ""
    @State private var genre: String = ""
    @State private var rating: Int = 1
    @State private var review: String = ""

    private let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of Book", text: $title)
                    TextField("Author's name", text: $author)

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section("Write a review") {
                    TextEditor(text: $review)

                    Picker("Rating", selection: $rating) {
                        ForEach(1..<6) {
                            Text(String($0))
                        }
                    }
                }

                Section {
                    Button("Save") {
                        let book = Book(title: title, author: author, genre: genre, review: review, rating: (rating + 1))
                        modelContext.insert(book)
                        dismiss()
                    }
                }
                .disabled(validateInputs() == false)
            }
            .navigationTitle("Add New Book")
        }
    }

    private func validateInputs() -> Bool {
        if title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { return false }
        if author.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { return false }
        if genre.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { return false }
        if review.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { return false }
        return true
    }
}

#Preview {
    AddBookView()
}
