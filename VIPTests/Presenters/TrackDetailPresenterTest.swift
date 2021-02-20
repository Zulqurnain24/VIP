//
//  TrackDetailPresenterTest.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class TrackDetailPresenterTest: XCTestCase {
    var sut: TrackDetailPresenter!
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
        let trackDetailVC = TrackDetailViewController()
        let trackDetailNVC = UINavigationController(rootViewController: trackDetailVC)
        sut = TrackDetailPresenter(view: trackDetailVC, track: trackViewModel, allTracks: [trackViewModel], navigationController: trackDetailNVC)
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func testDI() {

        XCTAssertNotNil(sut.view)
        XCTAssertNotNil(sut.interactor)
        XCTAssertNotNil(sut.track)
    }
    func testTrack() {
        XCTAssertEqual(sut.track, trackViewModel)
    }

}
