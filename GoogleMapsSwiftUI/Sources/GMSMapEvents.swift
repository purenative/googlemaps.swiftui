//
//  GMSMapEvents.swift
//  GoogleMapsSwiftUI
//
//  Created by Artem Eremeev on 30.07.2023.
//

import Foundation
import GoogleMaps

public class GMSMapEvents {
    
    var didChangePosition: (GMSCameraPosition) -> Void
    var idelAtPosition: (GMSCameraPosition) -> Void
    var didTapAtCoordinate: (CLLocationCoordinate2D) -> Void
    var didLongPressAt: (CLLocationCoordinate2D) -> Void
    var didTapMarker: (GMSMarker) -> Bool
    var didTapInfoWindowOfMarker: (GMSMarker) -> Void
    var didLongPressInfoWindowOfMarker: (GMSMarker) -> Void
    var didTapOverlay: (GMSOverlay) -> Void
    var didTapMyLocation: (CLLocationCoordinate2D) -> Void
    
    init(didChangePosition: @escaping (GMSCameraPosition) -> Void, idelAtPosition: @escaping (GMSCameraPosition) -> Void, didTapAtCoordinate: @escaping (CLLocationCoordinate2D) -> Void, didLongPressAt: @escaping (CLLocationCoordinate2D) -> Void, didTapMarker: @escaping (GMSMarker) -> Bool, didTapInfoWindowOfMarker: @escaping (GMSMarker) -> Void, didLongPressInfoWindowOfMarker: @escaping (GMSMarker) -> Void, didTapOverlay: @escaping (GMSOverlay) -> Void, didTapMyLocation: @escaping (CLLocationCoordinate2D) -> Void) {
        self.didChangePosition = didChangePosition
        self.idelAtPosition = idelAtPosition
        self.didTapAtCoordinate = didTapAtCoordinate
        self.didLongPressAt = didLongPressAt
        self.didTapMarker = didTapMarker
        self.didTapInfoWindowOfMarker = didTapInfoWindowOfMarker
        self.didLongPressInfoWindowOfMarker = didLongPressInfoWindowOfMarker
        self.didTapOverlay = didTapOverlay
        self.didTapMyLocation = didTapMyLocation
    }
    
    static var empty = GMSMapEvents(
        didChangePosition: { _ in },
        idelAtPosition: { _ in },
        didTapAtCoordinate: { _ in },
        didLongPressAt: { _ in },
        didTapMarker: { _ in false },
        didTapInfoWindowOfMarker: { _ in },
        didLongPressInfoWindowOfMarker: { _ in },
        didTapOverlay: { _ in },
        didTapMyLocation: { _ in }
    )
    
}
