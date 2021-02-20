//
//  SuggestionViewModelTests.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class SuggestionViewModelTests: XCTestCase {
    var sut: SuggestionViewModel!
    override func setUp() {
        super.setUp()
        sut = SuggestionViewModel(suggestion: "Eminem")
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func testSuggestionViewModel() {
        let suggestionViewModel = SuggestionViewModel(suggestion: "Eminem")

        XCTAssertEqual(sut, suggestionViewModel)
        XCTAssertEqual(sut.suggestion, suggestionViewModel.suggestion)
    }

}
