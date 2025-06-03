//
//  EditView.swift
//  Bucketlist
//
//  Created by Sylvan  on 03/06/2025.
//

import SwiftUI

enum LoadingState {
    case loading, loaded, failed
}

struct EditView: View {
    private var location: Location
    private var onSave: (Location) -> Void

    @Environment(\.dismiss) var dismiss

    @State private var name: String
    @State private var description: String

    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave
        _name = .init(initialValue: location.name)
        _description = .init(initialValue: location.description)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of the place", text: $name)
                    TextField("Description", text: $description)
                }
            }
            .navigationTitle("Details of the place")
            .toolbar {
                Button("Save") {
                    var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = name
                    newLocation.description = description
                    onSave(newLocation)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    EditView(location: .example, onSave: {_ in })
}
