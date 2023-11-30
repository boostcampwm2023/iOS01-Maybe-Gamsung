//
//  RewindViewController.swift
//  MusicSpot
//
//  Created by 윤동주 on 11/28/23.
//

import UIKit

protocol SearchMusicViewControllerDelegate: AnyObject {
    func navigateToHomeMap()
    func navigateToSaveJourney()
}

class SearchMusicViewController: UIViewController {

    var delegate: SearchMusicViewControllerDelegate?

    var label: UILabel = {
        var label = UILabel()
        label.text = "SearchMusic"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.view.addSubview(label)
    }

    @objc
    func navigateToHomeMap() {
        self.delegate?.navigateToHomeMap()
    }

    @objc
    func navigateToSaveJourney() {
        self.delegate?.navigateToSaveJourney()
    }
    
}
