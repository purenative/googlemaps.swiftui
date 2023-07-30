//
//  GMSMapCoordinator.swift
//  GoogleMapsSwiftUI
//
//  Created by Artem Eremeev on 30.07.2023.
//

import Foundation
import GoogleMaps
import GoogleMapsUtils

public class GMSMapCoordinator: NSObject, GMSMapViewDelegate {
    
    let events: GMSMapEvents
    let onZoomUpdated: (Float) -> Void
    weak var mapView: GMSMapView?
    var markers: Set<GMSMarker> = []
    var clusterManager: GMUClusterManager?
    
    init(events: GMSMapEvents, onZoomUpdated: @escaping (Float) -> Void) {
        self.events = events
        self.onZoomUpdated = onZoomUpdated
        super.init()
    }
    
    func setMapView(_ mapView: GMSMapView?, clusteringSettings: GMSClusteringSettings?) {
        guard let mapView else {
            return
        }
        
        self.mapView = mapView
        
        if let clusteringSettings {
            let renderer = GMUDefaultClusterRenderer(
                mapView: mapView,
                clusterIconGenerator: clusteringSettings.iconGenerator
            )
            clusterManager = GMUClusterManager(
                map: mapView,
                algorithm: clusteringSettings.algorithm,
                renderer: renderer
            )
            clusterManager?.setMapDelegate(self)
        } else {
            mapView.delegate = self
        }
    }
    
    func setMarkers(_ markers: [GMSMarker]) -> Bool {
        let newMarkers = Set(markers)
        
        guard newMarkers != self.markers else {
            return false
        }
        
        if let clusterManager {
            for marker in self.markers {
                clusterManager.remove(marker)
            }
            
            for marker in newMarkers {
                clusterManager.add(marker)
            }
            clusterManager.cluster()
        } else {
            for marker in self.markers {
                marker.map = nil
            }
            
            for marker in newMarkers {
                marker.map = mapView
            }
        }
        
        self.markers = newMarkers
        
        return true
    }
    
    func setZoom(_ zoom: Float) {
        guard let mapView, mapView.camera.zoom != zoom else {
            return
        }
        mapView.animate(toZoom: zoom)
    }
    
    // MARK: - GMSMapViewDelegate
    public func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        onZoomUpdated(position.zoom)
        events.didChangePosition(position)
    }
    
    public func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        events.idelAtPosition(position)
    }
    
    public func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        events.didTapAtCoordinate(coordinate)
    }
    
    public func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        events.didLongPressAt(coordinate)
    }
    
    public func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        if let _ = marker.userData as? GMUCluster {
            mapView.animate(toLocation: marker.position)
            mapView.animate(toZoom: mapView.camera.zoom + 1)
            return false
        } else {
            return events.didTapMarker(marker)
        }
    }
    
    public func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        events.didTapInfoWindowOfMarker(marker)
    }
    
    public func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        events.didLongPressInfoWindowOfMarker(marker)
    }
    
    public func mapView(_ mapView: GMSMapView, didTap overlay: GMSOverlay) {
        events.didTapOverlay(overlay)
    }
    
    public func mapView(_ mapView: GMSMapView, didTapMyLocation location: CLLocationCoordinate2D) {
        events.didTapMyLocation(location)
    }

}
