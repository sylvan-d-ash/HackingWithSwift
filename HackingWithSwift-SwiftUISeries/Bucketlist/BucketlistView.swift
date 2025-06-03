//
//  BucketlistView.swift
//  Bucketlist
//
//  Created by Sylvan  on 02/06/2025.
//

import SwiftUI
import MapKit

public struct BucketlistView: View {
    private let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -1, longitude: 36.8),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )

    public init() {}

    public var body: some View {
        MapReader { proxy in
            Map(initialPosition: startPosition)
                .onTapGesture { position in
                    print("Tapped at \(position)")
                    if let coordinate = proxy.convert(position, from: .local) {
                        print("Coordinate: (\(coordinate.latitude), \(coordinate.longitude))")
                    }
                }
        }
    }
}

#Preview {
    BucketlistView()
}
