//
//  SuggestionsViewTest.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class SuggestionsViewTest: XCTestCase {
    var sut: SuggestionsView!
    override func setUp() {
        super.setUp()
        sut = SuggestionsView()
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func testInit() {
        XCTAssertEqual(sut.noSuggestionsLabel.font, UIFont.mediumWithSize(size: 14.0))
        XCTAssertEqual(sut.noSuggestionsLabel.textColor, .lightGray)
        XCTAssertEqual(sut.noSuggestionsLabel.textAlignment, .center)
        XCTAssertEqual(sut.noSuggestionsLabel.textAlignment, .center)
        XCTAssertEqual(sut.noSuggestionsLabel.text, "No suggestions")
    }
}
