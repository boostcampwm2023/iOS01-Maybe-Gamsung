//
//  Artwork.swift
//  MSDomain
//
//  Created by 이창준 on 2023.12.07.
//

import Foundation

public struct Artwork {
    
    // MARK: - Properties
    
    public let width: Double
    public let height: Double
    public let url: URL
    public let backgroundColor: String
    public let textColor1: String
    public let textColor2: String
    public let textColor3: String
    public let textColor4: String
    
    // MARK: - Initializer
    
    public init(width: Double,
                height: Double,
                url: URL,
                backgroundColor: String,
                textColor1: String,
                textColor2: String,
                textColor3: String,
                textColor4: String) {
        self.width = width
        self.height = height
        self.url = url
        self.backgroundColor = backgroundColor
        self.textColor1 = textColor1
        self.textColor2 = textColor2
        self.textColor3 = textColor3
        self.textColor4 = textColor4
    }
    
}

// MARK: - Hashable

extension Artwork: Hashable { }
