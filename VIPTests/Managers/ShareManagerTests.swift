//
//  ShareManagerTests.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class ShareManagerTests: XCTestCase {
    var sut: ShareManager!
    override func setUp() {
        super.setUp()
        sut = ShareManager.shared
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func testShareManager() {

        sut.defaultShareMessage = "Hello"

        XCTAssertEqual(sut.defaultShareMessage, sut.getDetaultShareMessage())
    }

}
