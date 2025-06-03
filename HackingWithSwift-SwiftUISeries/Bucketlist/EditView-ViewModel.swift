//
//  EditView-ViewModel.swift
//  Bucketlist
//
//  Created by Sylvan  on 03/06/2025.
//

import Foundation

extension EditView {
    enum LoadingState {
        case loading, loaded, failed
    }

    @Observable
    final class ViewModel {
        var name: String
        var description: String

        private(set) var loadingState: LoadingState = .loading
        private(set) var pages: [Page] = []

        private var location: Location

        init(location: Location) {
            self.location = location
            name = location.name
            description = location.description
        }

        func fetchNearbyPlaces() async {
            let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.latitude)%7C\(location.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"

            guard let url = URL(string: urlString) else {
                print("Bad url: \(urlString)")
                return
            }

            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let items = try JSONDecoder().decode(Results.self, from: data)
                pages = items.query.pages.values.sorted()
                loadingState = .loaded
            } catch {
                print("Error: \(error.localizedDescription)")
                loadingState = .failed
            }
        }

        func save() -> Location {
            var newLocation = location
            newLocation.id = UUID()
            newLocation.name = name
            newLocation.description = description
            return newLocation
        }
    }
}
