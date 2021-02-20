//
//  ShareViewTest.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class ShareViewTest: XCTestCase {
    var sut: ShareView!
    override func setUp() {
        super.setUp()
        sut = ShareView()
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func testInit() {
        XCTAssertEqual(sut.shareButton.currentTitleColor, .black)
        XCTAssertEqual(sut.shareButton.currentBackgroundImage, UIImage(named: "ShareIcon"))

    }
}
