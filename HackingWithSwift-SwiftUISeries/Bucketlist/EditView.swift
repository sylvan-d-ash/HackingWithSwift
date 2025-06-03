//
//  EditView.swift
//  Bucketlist
//
//  Created by Sylvan  on 03/06/2025.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    @State private var viewModel: ViewModel

    private var onSave: (Location) -> Void

    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.onSave = onSave
        _viewModel = .init(wrappedValue: ViewModel(location: location))
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of the place", text: $viewModel.name)
                    TextField("Description", text: $viewModel.description)
                }

                Section("Interesting Places Nearby") {
                    switch viewModel.loadingState {
                    case .loading:
                        ProgressView()
                            .frame(maxWidth: .infinity)
                    case .loaded:
                        ForEach(viewModel.pages, id: \.pageid) { page in
                            /*@START_MENU_TOKEN@*/Text(page.title)/*@END_MENU_TOKEN@*/
                                .font(.headline)
                            + Text(": ") +
                            Text(page.description)
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
                    onSave(viewModel.save())
                    dismiss()
                }
            }
            .task {
                await viewModel.fetchNearbyPlaces()
            }
        }
    }
}

#Preview {
    EditView(location: .example, onSave: {_ in })
}
