//
//  SuggestionTableViewCellTest.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class SuggestionTableViewCellTest: XCTestCase {
    var sut: SuggestionTableViewCell!
    override func setUp() {
        super.setUp()
        sut = SuggestionTableViewCell()
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func testInit() {
        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.suggestionLabel)
        XCTAssertNotNil(SuggestionTableViewCell.identifier)
        XCTAssertEqual(SuggestionTableViewCell.identifier, "SuggestionTableViewCell")
        XCTAssertEqual(sut.suggestionLabel.font, UIFont.mediumWithSize(size: 17.0))
        XCTAssertEqual(sut.suggestionLabel.textColor, .black)
        XCTAssertEqual(sut.suggestionLabel.numberOfLines, 1)
        XCTAssertEqual(sut.suggestionLabel.backgroundColor, .clear)
        XCTAssertEqual(SuggestionTableViewCell.Layout.SuggestionsLabel.leading, 16.0)
        XCTAssertEqual(SuggestionTableViewCell.Layout.SuggestionsLabel.trailing, 16.0)
    }
}
