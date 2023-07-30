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
    
    let clusteringSettings: GMSClusteringSettings?
    
    public init(markers: Binding<[GMSMarker]>, zoom: Binding<Float>? = nil, clusteringSettings: GMSClusteringSettings? = nil) {
        _markers = markers
        self.zoom = zoom
        self.clusteringSettings = clusteringSettings
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
        let markersUpdated = context.coordinator.setMarkers(markers)
        
        guard !markersUpdated else {
            return
        }
        
        if let zoom {
            context.coordinator.setZoom(zoom.wrappedValue)
        }
    }
    
    public func makeCoordinator() -> GMSMapCoordinator {
        GMSMapCoordinator(
            events: events,
            onZoomUpdated: { zoom?.wrappedValue = $0 }
        )
    }
    
}
