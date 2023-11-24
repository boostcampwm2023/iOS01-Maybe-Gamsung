//
//  MSProgressView.swift
//  RewindJourney
//
//  Created by 전민건 on 11/22/23.
//

import UIKit

public final class MSProgressView: UIProgressView {
    
    // MARK: - Properties
    
    public var percentage: Float = 0.0 {
        didSet {
            syncProgress(percentage: percentage)
        }
    }
    public var isHighlight: Bool = false {
        didSet {
            self.percentage = self.isHighlight ? 1.0 : 0.0
        }
    }
    
    
    // MARK: - Configure
    
    private func configureColor() {
        self.trackTintColor = .systemGray6
        self.tintColor = .white
    }
    
    // MARK: - Initializer
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("MusicSpot은 code-based 로 개발되었습니다.")
    }
    
    // MARK: - Functions: change progress
    
    private func syncProgress(percentage: Float) {
        self.progress = percentage
    }
    
}
