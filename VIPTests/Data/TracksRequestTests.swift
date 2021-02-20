//
//  TracksRequestTests.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class TracksRequestTests: XCTestCase {
    var sut: TracksRequest!

    override func setUp() {
        super.setUp()
        sut = TracksRequest(search: "Waves")
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func testInit() {
        XCTAssertEqual(sut.url!, URL(string: "https://itunes.apple.com/search?term=Waves"))
    }

}
