//
//  PlayerControlsTest.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class PlayerControlsTest: XCTestCase {
    var sut: PlayerControls!
    override func setUp() {
        super.setUp()
        sut = PlayerControls()
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func testInit() {
        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.playButton)
        XCTAssertNotNil(sut.prevButton)
        XCTAssertNotNil(sut.nextButton)
        XCTAssertNotNil(sut.isPlaying)
        XCTAssertEqual(sut.isPlaying, false)
        XCTAssertEqual(sut.height, PlayerControls.Layout.height)
        XCTAssertEqual(sut.width, PlayerControls.Layout.width)
        XCTAssertEqual(sut.backgroundColor, .clear)
        XCTAssertEqual(sut.backgroundColor, .clear)
    }
}
