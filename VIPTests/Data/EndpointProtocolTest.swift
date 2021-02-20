//
//  EndpointProtocolTest.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class EndpointProtocolTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }
    func testValues() {
        XCTAssertEqual(Constants.baseUrl, "https://itunes.apple.com/search")
        XCTAssertEqual(Constants.Fields.term, "term")
        XCTAssertEqual(Constants.Fields.media, "media")
        XCTAssertEqual(Constants.Fields.entity, "entity")
        XCTAssertEqual(Constants.Fields.attribute, "attribute")
        XCTAssertEqual(Constants.Fields.limit, "limit")
        XCTAssertEqual(Constants.Parameters.limit, 200)
        XCTAssertEqual(Constants.Parameters.music, "music")
    }
}
