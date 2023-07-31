//
//  GMSMap+Events.swift
//  GoogleMapsSwiftUI
//
//  Created by Artem Eremeev on 30.07.2023.
//

import Foundation
import GoogleMaps
import SwiftUI

private extension GMSMap {
    
    func modifyEvents(_ modification: (GMSMapEvents) -> Void) -> Self {
        modification(events)
        return self
    }
    
}

public extension GMSMap {
    
    func didChangeCameraPosition(_ action: @escaping (GMSCameraPosition) -> Void) -> Self {
        modifyEvents { $0.didChangePosition = action }
    }
    
    func idleAtPosition(_ action: @escaping (GMSCameraPosition) -> Void) -> Self {
        modifyEvents { $0.idelAtPosition = action }
    }
    
    func didTapAtCoordinate(_ action: @escaping (CLLocationCoordinate2D) -> Void) -> Self {
        modifyEvents { $0.didTapAtCoordinate = action }
    }
    
    func didLongPressAt(_ action: @escaping (CLLocationCoordinate2D) -> Void) -> Self {
        modifyEvents { $0.didLongPressAt = action }
    }
    
    func didTapMarker(_ action: @escaping (GMSMarker) -> Bool) -> Self {
        modifyEvents { $0.didTapMarker = action }
    }
    
    func didTapInfoWindowOfMarker(_ action: @escaping (GMSMarker) -> Void) -> Self {
        modifyEvents { $0.didTapInfoWindowOfMarker = action }
    }
    
    func didLongPressInfoWindowOfMarker(_ action: @escaping (GMSMarker) -> Void) -> Self {
        modifyEvents { $0.didLongPressInfoWindowOfMarker = action }
    }
    
    func didTapOverlay(_ action: @escaping (GMSOverlay) -> Void) -> Self {
        modifyEvents { $0.didTapOverlay = action }
    }
    
    func didTapMyLocation(_ action: @escaping (CLLocationCoordinate2D) -> Void) -> Self {
        modifyEvents { $0.didTapMyLocation = action }
    }
    
}
