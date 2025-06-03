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

    @State private var loadingState: LoadingState = .loading
    @State private var pages: [Page] = []

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

                Section("Interesting Places Nearby") {
                    switch loadingState {
                    case .loading:
                        ProgressView()
                            .frame(maxWidth: .infinity)
                    case .loaded:
                        ForEach(pages, id: \.pageid) { page in
                            /*@START_MENU_TOKEN@*/Text(page.title)/*@END_MENU_TOKEN@*/
                                .font(.headline)
                            + Text(": ") +
                            Text("Page description here")
                                .italic()
                        }
                    case .failed:
                        Text("Please try again later")
                            .font(.caption)
                            .foregroundStyle(.red)
                    }
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
