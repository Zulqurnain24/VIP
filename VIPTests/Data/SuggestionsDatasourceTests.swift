//
//  ViewTests.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class SuggestionsDatasourceTests: XCTestCase {
    var sut: SuggestionsDatasource!
    override func setUp() {
        super.setUp()
        sut = SuggestionsDatasource()
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func testSuggestionsDatasource() {
        let suggestionViewModel = SuggestionViewModel(suggestion: "Eminem")
            sut.suggestions.append(suggestionViewModel)
        XCTAssertEqual(sut.suggestions.first, suggestionViewModel)
    }

}
