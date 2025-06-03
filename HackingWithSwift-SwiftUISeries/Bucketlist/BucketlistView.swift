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
                    Marker(location.name, coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
                }
            }
            .onTapGesture { position in
                mapTapped(at: position, proxy: proxy)
            }
        }
    }

    private func mapTapped(at position: CGPoint, proxy: MapProxy) {
        guard let coordinate = proxy.convert(position, from: .local) else { return }
        let location = Location(id: UUID(), name: "New location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
        locations.append(location)
    }
}

#Preview {
    BucketlistView()
}
