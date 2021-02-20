//
//  ResultErrorTest.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class ResultErrorTest: XCTestCase {
    var sut: ResultError!

    override func setUp() {
        super.setUp()
        sut = ResultError(error: ResultError.networkError(code: HTTPCode(intValue: 100)))
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func testInit() {
        XCTAssertEqual(sut.httpCode, HTTPCode(intValue: -1))
        sut = ResultError(error: ResultError.serverError(code: HTTPCode(intValue: 100), underlying: RequestErrorResponse(errors: [[ : ]])))
        XCTAssertEqual(sut.isConnectionError, false)
    }
}
