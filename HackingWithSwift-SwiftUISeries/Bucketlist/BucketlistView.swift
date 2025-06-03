//
//  BucketlistView.swift
//  Bucketlist
//
//  Created by Sylvan  on 02/06/2025.
//

import SwiftUI
import MapKit

public struct BucketlistView: View {
    @State private var viewModel = ViewModel()

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
                ForEach(viewModel.locations) { location in
                    Annotation(location.name, coordinate: location.coordinate) {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.blue)
                            .frame(width: 32, height: 32)
                            .background(.white)
                            .clipShape(.circle)
                            .onLongPressGesture {
                                viewModel.selectedPlace = location
                            }
                    }
                }
            }
            .onTapGesture { position in
                guard let coordinate = proxy.convert(position, from: .local) else { return }
                viewModel.addLocation(at: coordinate)
            }
            .sheet(item: $viewModel.selectedPlace) { place in
                EditView(location: place) {
                    viewModel.update(location: $0)
                }
            }
        }
    }
}

#Preview {
    BucketlistView()
}
