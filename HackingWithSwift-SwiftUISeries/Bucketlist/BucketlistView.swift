//
//  BucketlistView.swift
//  Bucketlist
//
//  Created by Sylvan  on 02/06/2025.
//

import SwiftUI
import MapKit

public struct BucketlistView: View {
    @State private var locations = [Location]()
    @State private var selectedPlace: Location?

    private let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -1, longitude: 36.8),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )

    public init() {}

    public var body: some View {
        MapReader { proxy in
            Map(initialPosition: startPosition) {
                ForEach(locations) { location in
                    Annotation(location.name, coordinate: location.coordinate) {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.blue)
                            .frame(width: 32, height: 32)
                            .background(.white)
                            .clipShape(.circle)
                            .onLongPressGesture {
                                selectedPlace = location
                            }
                    }
                }
            }
            .onTapGesture { position in
                mapTapped(at: position, proxy: proxy)
            }
            .sheet(item: $selectedPlace) { place in
                EditView(location: place) { newLocation in
                    guard let index = locations.firstIndex(of: place) else { return }
                    locations[index] = newLocation
                }
            }
        }
    }

    private func mapTapped(at position: CGPoint, proxy: MapProxy) {
        guard let coordinate = proxy.convert(position, from: .local) else { return }
        print("Coordinates: \(coordinate)")
        let location = Location(id: UUID(), name: "New location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
        locations.append(location)

        selectedPlace = location
    }
}

#Preview {
    BucketlistView()
}
