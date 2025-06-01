//
//  Book.swift
//  Bookworm
//
//  Created by Sylvan  on 01/06/2025.
//

import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int

    init(title: String, author: String, genre: String, review: String, rating: Int) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
    }
}

public enum BookwormSwiftDataManager {
    public static let shared: ModelContainer = {
        do {
            let schema = Schema([Book.self])
            let config = ModelConfiguration()
            return try ModelContainer(for: schema, configurations: [config])
        } catch {
            fatalError("Failed to initialize ModelContainer: \(error.localizedDescription)")
        }
    }()

    public static func inMemory() throws -> ModelContainer {
        let schema = Schema([Book.self])
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        return try ModelContainer(for: schema, configurations: [config])
    }

    public static func previewContainer() -> ModelContainer {
        do {
            return try inMemory()
        } catch {
            fatalError("Failed to create preview container: \(error.localizedDescription)")
        }
    }
}
