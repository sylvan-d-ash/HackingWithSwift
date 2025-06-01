//
//  DetailsView.swift
//  Bookworm
//
//  Created by Sylvan  on 01/06/2025.
//

import SwiftUI

private class BookwormBundleLocator {}

struct DetailsView: View {
    let book: Book

    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre, bundle: Bundle(for: BookwormBundleLocator.self))
                    .resizable()
                    .scaledToFit()

                Text(book.genre.uppercased())
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }

            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)

            Text(book.review)
                .padding()

            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    let book = Book(title: "Test Book", author: "The Author", genre: "Fantasy", review: "Greatest book ever!", rating: 3)
    NavigationStack {
        DetailsView(book: book)
            .modelContainer(BookwormSwiftDataManager.previewContainer())
    }
}
