//
//  Coordinate.swift
//  MSDomain
//
//  Created by 이창준 on 2023.12.06.
//

import Foundation

public struct Coordinate {
    
    // MARK: - Properties
    
    public let latitude: Double
    public let longitude: Double
    
    // MARK: - Initializer
    
    public init(latitude: Double,
                longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    // MARK: - Functions
    
    public func distance(from target: Coordinate) -> Double {
        let latitudeDifference = self.latitude - target.latitude
        let longitudeDifference = self.longitude - target.longitude
        return sqrt(pow(latitudeDifference, 2) + pow(longitudeDifference, 2))
    }
    
}

// MARK: - Hashable

extension Coordinate: Hashable { }

// MARK: - Codable

// SwiftData에서 사용되기 위한 Codable 프로토콜 충족
extension Coordinate: Codable { }

// MARK: - String Convertible

extension Coordinate: CustomStringConvertible {
    
    public var description: String {
        return """
        Coordinate
        - latitude: \(self.latitude)
        - longitude: \(self.longitude)
        """
    }
    
}
