//
//  GMSMap.swift
//  GoogleMapsSwiftUI
//
//  Created by Artem Eremeev on 30.07.2023.
//

import SwiftUI
import GoogleMaps

public struct GMSMap: UIViewControllerRepresentable {
    
    @State
    var events: GMSMapEvents = .empty
    
    @Binding
    var markers: [GMSMarker]
    
    var zoom: Binding<Float>?
    var bounds: Binding<GMSCoordinateBounds?>?
    
    let clusteringSettings: GMSClusteringSettings?
    
    let padding: CGFloat
    
    public init(markers: Binding<[GMSMarker]>, zoom: Binding<Float>? = nil, bounds: Binding<GMSCoordinateBounds?>? = nil, clusteringSettings: GMSClusteringSettings? = nil, padding: CGFloat = 100) {
        _markers = markers
        self.zoom = zoom
        self.bounds = bounds
        self.clusteringSettings = clusteringSettings
        self.padding = padding
    }
    
    public func makeUIViewController(context: Context) -> GMSMapViewController {
        let mapViewController = GMSMapViewController()
        context.coordinator.setMapView(
            mapViewController.mapView,
            clusteringSettings: clusteringSettings
        )
        return mapViewController
    }
    
    public func updateUIViewController(_ mapViewController: GMSMapViewController, context: Context) {
        context.coordinator.setMarkers(markers)
        
        if let zoom {
            context.coordinator.setZoom(zoom.wrappedValue)
        }
        
        if let bounds = bounds?.wrappedValue {
            context.coordinator.setCameraBounds(bounds)
        }
    }
    
    public func makeCoordinator() -> GMSMapCoordinator {
        GMSMapCoordinator(
            events: events,
            padding: padding,
            onZoomUpdated: { zoom?.wrappedValue = $0 }
        )
    }
    
}
