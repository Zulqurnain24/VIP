//
//  PlayerTrackDurationTest.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class PlayerTrackDurationTest: XCTestCase {
    var sut: PlayerTrackDuration!
    override func setUp() {
        super.setUp()
        sut = PlayerTrackDuration()
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func testInit() {
        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.slider)
        XCTAssertNotNil(sut.currentDuration)
        XCTAssertNotNil(sut.totalDuration)
        XCTAssertEqual(sut.height, PlayerTrackDuration.Layout.height)
        XCTAssertEqual(sut.width, PlayerTrackDuration.Layout.width)
    }
}
