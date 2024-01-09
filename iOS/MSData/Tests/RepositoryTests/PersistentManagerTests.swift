//
//  PersistableRepositoryTests.swift
//  MSData
//
//  Created by 전민건 on 12/11/23.
//

import XCTest
@testable import MSData
@testable import MSDomain
@testable import MSPersistentStorage

final class PersistentManagerTests: XCTestCase {
    
    // MARK: - Properties
    
    let storage = FileManagerStorage()
    
    // MARK: - Tests

    func test_Spot저장_성공() {
        let coordinate = Coordinate(latitude: 10, longitude: 10)
        let url = URL(string: "/../")!
        
        let spot = Spot(coordinate: coordinate, timestamp: .now, photoURL: url)
        
        XCTAssertTrue(RecordingJourneyStorage.shared.record(SpotDTO(spot), at: self.storage))
    }
    
    func test_RecordingJourney_하위요소가_아닌_것들_저장_실패() {
        XCTAssertFalse(RecordingJourneyStorage.shared.record(Int(), at: self.storage))
    }
    
    func test_RecordingJourney_반환_성공() {
        let url = URL(string: "/../")!
        
        let id = "id"
        let startTimestamp = Date.now
        let coordinate = Coordinate(latitude: 5, longitude: 5)
        let spot = Spot(coordinate: coordinate, timestamp: .now, photoURL: url)
        
        RecordingJourneyStorage.shared.record(id, at: self.storage)
        RecordingJourneyStorage.shared.record(Date.now, at: self.storage)
        RecordingJourneyStorage.shared.record(SpotDTO(spot), at: self.storage)
        RecordingJourneyStorage.shared.record(CoordinateDTO(coordinate), at: self.storage)
        
        guard let loadedJourney = RecordingJourneyStorage.shared.loadJourney(from: self.storage) else {
            XCTFail("load 실패")
            return
        }
        
        XCTAssertEqual(loadedJourney.id, id)
        XCTAssertEqual(loadedJourney.startTimestamp.description, startTimestamp.description)
        XCTAssertEqual(loadedJourney.spots.description, [spot].description)
        XCTAssertEqual(loadedJourney.coordinates, [coordinate])
    }

}
