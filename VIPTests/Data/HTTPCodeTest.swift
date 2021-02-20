//
//  HTTPCodeTest.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class HTTPCodeTest: XCTestCase {
    var sut: HTTPCode!

    override func setUp() {
        super.setUp()
        sut = HTTPCode(intValue: 100)
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func testInit() {
        sut = HTTPCode(intValue: 100)
        XCTAssertEqual(sut.isInformational, true)
        sut = HTTPCode(intValue: 200)
        XCTAssertEqual(sut.isSuccess, true)
        sut = HTTPCode(intValue: 300)
        XCTAssertEqual(sut.isRedirection, true)
        sut = HTTPCode(intValue: 400)
        XCTAssertEqual(sut.isClientError, true)
        sut = HTTPCode(intValue: 410)
        XCTAssertEqual(sut.isSessionError, true)
        sut = HTTPCode(intValue: 500)
        XCTAssertEqual(sut.isServerError, true)
    }
}
