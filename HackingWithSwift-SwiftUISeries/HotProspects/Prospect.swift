//
//  Prospect.swift
//  HotProspects
//
//  Created by Sylvan  on 13/06/2025.
//

import SwiftData

@Model
public class Prospect {
    var name: String
    var emailAddress: String
    var isContacted: Bool

    init(name: String, emailAddress: String, isContacted: Bool) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
    }
}

enum HotProspectsDataManager {
    static func previewContainer() -> ModelContainer {
        do {
            let schema = Schema([Prospect.self])
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            return try ModelContainer(for: schema, configurations: [config])
        } catch {
            fatalError("Failed to create preview container: \(error.localizedDescription)")
        }
    }
}
