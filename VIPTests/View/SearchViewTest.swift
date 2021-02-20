//
//  SearchViewTest.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class SearchViewTest: XCTestCase {
    var sut: SearchView!
    override func setUp() {
        super.setUp()
        sut = SearchView()
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func testInit() {
        XCTAssertEqual(sut.height, 46.0)

    }
}
