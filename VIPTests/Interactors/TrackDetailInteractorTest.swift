//
//  TrackDetailInteractorTest.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class TrackDetailInteractorTest: XCTestCase {
    var sut: TrackDetailInteractor!
    let trackViewModel = TrackViewModel(trackId: 0,
                            artistName: "Jessica",
                            trackName: "River Side Sun",
                            artworkUrl: URL(string: "https://www.youtube.com/watch?v=Xx_jxLt-i-0"),
                            releaseDate: "2000",
                            releaseYear: "2000",
                            previewUrl: URL(string: "https://twitter.com/Singitjess/status/879324814342795265/photo/1"),
                            primaryGenreName: "Rock",
                            trackViewUrl: URL(string: "https://twitter.com/Singitjess/status/879324814342795265/photo/1"),
                            trackDuration: "3:47",
                            trackPrice: "$3.00",
                            collectionName: "RiverSide")
    override func setUp() {
        super.setUp()
        sut = TrackDetailInteractor(track: trackViewModel, allTracks: [trackViewModel])
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func testDI() {
        XCTAssertNotNil(sut.track)
        XCTAssertNotNil(sut.allTracks)
    }
    func testValues() {
        XCTAssertEqual(sut.track, trackViewModel)
        XCTAssertEqual(sut.allTracks, [trackViewModel])
    }
}
