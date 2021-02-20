//
//  TrackTests.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class TrackResponseTests: XCTestCase {
    var sut: TrackResponse!
    let trackResponse = TrackResponse(artistName: "Jessica",
                                      trackId: 0,
                                      trackName: "Jessica",
                                      trackViewUrl: "https://www.youtube.com/watch?v=Xx_jxLt-i-0",
                                      previewUrl: "https://twitter.com/Singitjess/status/879324814342795265/photo/1",
                                      artworkUrl100: "https://twitter.com/Singitjess/status/879324814342795265/photo/1",
                                      releaseDate: "1/01/2021",
                                      primaryGenreName: "Rock",
                                      trackPrice: 4.0,
                                      currency: "usd",
                                      trackTimeMillis: 1000,
                                      collectionName: "RiverSide")
    override func setUp() {
        super.setUp()
        sut = trackResponse
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func testInit() {
        XCTAssertEqual(sut, trackResponse)
    }

}
