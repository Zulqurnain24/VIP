//
//  PlayerManagerTests.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class PlayerManagerTests: XCTestCase {
    var sut: PlayerManager!
    override func setUp() {
        super.setUp()
        sut = PlayerManager.shared
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func testPlayerManager() {
        
        XCTAssertEqual(sut.isPlaying, false)
    }

}
