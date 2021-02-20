//
//  TrackManagerTests.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class TrackManagerTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetExtraLargeImage() {
        let artworkUrl30x30 = URL(string: "https://is3-ssl.mzstatic.com/image/thumb/Video118/v4/6b/2f/f1/6b2ff173-f5d6-30dc-300c-4eeb50010d03/source/30x30bb.jpg")
        let artworkUrl60x60 = URL(string: "https://is3-ssl.mzstatic.com/image/thumb/Video118/v4/6b/2f/f1/6b2ff173-f5d6-30dc-300c-4eeb50010d03/source/60x60bb.jpg")
        let artworkUrl100x100 = URL(string: "https://is3-ssl.mzstatic.com/image/thumb/Video118/v4/6b/2f/f1/6b2ff173-f5d6-30dc-300c-4eeb50010d03/source/100x100bb.jpg")

        let artworkUrlExtraLarge30x30 = TrackManager.shared.getExtraLargeUrlWith(artworkUrl30x30, type: .small)
        let artworkUrlExtraLarge60x60 = TrackManager.shared.getExtraLargeUrlWith(artworkUrl60x60, type: .medium)
        let artworkUrlExtraLarge100x100 = TrackManager.shared.getExtraLargeUrlWith(artworkUrl100x100, type: .large)

        XCTAssert(artworkUrlExtraLarge30x30?
                    .absoluteString == "https://is3-ssl.mzstatic.com/image/thumb/"
                                        + "Video118/v4/6b/2f/f1/6b2ff173-f5d6"
                                        + "-30dc-300c-4eeb50010d03/source/200x200bb.jpg")
        XCTAssert(artworkUrlExtraLarge60x60?
                    .absoluteString == "https://is3-ssl.mzstatic.com/image/thumb/"
                                       + "Video118/v4/6b/2f/f1/6b2ff173-f5d6-30dc-"
                                       + "300c-4eeb50010d03/source/200x200bb.jpg")
        XCTAssert(artworkUrlExtraLarge100x100?
                    .absoluteString == "https://is3-ssl.mzstatic.com/image/thumb"
                                       + "/Video118/v4/6b/2f/f1/6b2ff173-f5d6-30"
                                       + "dc-300c-4eeb50010d03/source/200x200bb.jpg")
    }

    func testTrackTimemmssFormat() {
        let trackTimemmssFormat = TrackManager.shared.getTrackTimemmssFormatWith(trackTimeMillis: 243027)
        XCTAssert(trackTimemmssFormat == "4:03")
    }

}
