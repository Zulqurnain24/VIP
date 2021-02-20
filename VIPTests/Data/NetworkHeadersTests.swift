//
//  NetworkHeadersTests.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class NetworkHeadersTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }
    func testKeys() {
        XCTAssertEqual(NetworkHeaders.Keys.authorizationKey, "Authorization")
    }
    func testInit() {
        let headers = NetworkHeaders.create()
        XCTAssertNotNil(headers)
    }
}
