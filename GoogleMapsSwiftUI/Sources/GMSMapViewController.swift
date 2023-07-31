//
//  GMSMapViewController.swift
//  GoogleMapsSwiftUI
//
//  Created by Artem Eremeev on 30.07.2023.
//

import UIKit
import GoogleMaps

public class GMSMapViewController: UIViewController {
    
    var mapView: GMSMapView? {
        view as? GMSMapView
    }
    
    public override func loadView() {
        super.loadView()
        
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            let errorLabel = UILabel(frame: .zero)
            errorLabel.text = "GoogleMaps not work on preview"
            errorLabel.font = .systemFont(ofSize: 24, weight: .semibold)
            errorLabel.textAlignment = .center
            view = errorLabel
        } else {
            let mapView = GMSMapView(frame: .zero)
            view = mapView
        }
    }
    
}
