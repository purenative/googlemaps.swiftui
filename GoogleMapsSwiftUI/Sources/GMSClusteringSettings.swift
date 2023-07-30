//
//  GMSClusteringSettings.swift
//  GoogleMapsSwiftUI
//
//  Created by Artem Eremeev on 30.07.2023.
//

import Foundation
import GoogleMapsUtils

public struct GMSClusteringSettings {
    
    let iconGenerator: GMUClusterIconGenerator
    let algorithm: GMUClusterAlgorithm
    
    public init(iconGenerator: GMUClusterIconGenerator, algorithm: GMUClusterAlgorithm) {
        self.iconGenerator = iconGenerator
        self.algorithm = algorithm
    }
    
    public static let `default` = GMSClusteringSettings(
        iconGenerator: GMUDefaultClusterIconGenerator(),
        algorithm: GMUNonHierarchicalDistanceBasedAlgorithm()
    )
    
}
