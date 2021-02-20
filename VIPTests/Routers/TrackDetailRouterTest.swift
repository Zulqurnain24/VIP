//
//  TrackDetailRouterTest.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class TrackDetailRouterTest: XCTestCase {
    var sut: TrackDetailRouter!
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
        let trackDetailViewVC = TrackDetailViewController()
        let trackDetailViewNVC = UINavigationController(rootViewController: trackDetailViewVC)
        sut = TrackDetailRouter(navigationController: trackDetailViewNVC)
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func testDI() {
        XCTAssertNotNil(sut.navigationController)
    }
    func testSetupModule() {
        let trackDetailViewVC = TrackDetailViewController()
        let trackDetailViewNVC = UINavigationController(rootViewController: trackDetailViewVC)
        let navigationController = TrackDetailRouter.setupModuleWithCurrentTrack(trackViewModel, allTracks: [trackViewModel], navigationController: trackDetailViewNVC)
        XCTAssertNotNil(navigationController)
    }
}
