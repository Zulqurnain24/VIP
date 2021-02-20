//
//  SearchListInteractorTest.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class SearchListInteractorTest: XCTestCase {
    var sut: SearchListInteractor!
    var requestManager = RequestManager()
    let suggestionViewModel = SuggestionViewModel(suggestion: "Eminem")
    let trackViewModel = TrackViewModel(trackId: 0,
                            artistName: "Jessica",
                            trackName: "River Side Sun",
                            artworkUrl: URL(string: "https://www.youtube.com/watch?v=Xx_jxLt-i-0"),
                            releaseDate: "2000",
                            releaseYear: "2000",
                            previewUrl: URL(string: "https://twitter.com/Singitjess/status/879324814342795265/photo/1"),
                            primaryGenreName: "Rock",
                            trackViewUrl: URL(string: "https://twitter.com/Singitjess/status/879324814342795265/photo/1"),
                            trackDuration: "3:47",
                            trackPrice: "$3.00",
                            collectionName: "RiverSide")
    override func setUp() {
        super.setUp()
        sut = SearchListInteractor(requestManager: requestManager, tracksViewModel: [trackViewModel], suggestions: [suggestionViewModel])
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func testDI() {
        XCTAssertNotNil(sut.requestManager)
        XCTAssertNotNil(sut.tracksViewModel)
        XCTAssertNotNil(sut.suggestions)
    }
    func testInteractor() {
        XCTAssertEqual(sut.getLocalTracks(), [trackViewModel])
        XCTAssertEqual(sut.suggestions, [suggestionViewModel])
    }
    func testGetTrackSelectedAt() {
        XCTAssertEqual(sut.getTrackSelectedAt(.zero), trackViewModel)
    }
    func testClear() {
        sut.clear()
        XCTAssertEqual(sut.tracksViewModel, [])
    }
    func testGetAllSuggestions() {
        let expectation = self.expectation(description: #function)
        sut.getAllSuggestions { (suggestionsArray) in
            XCTAssertEqual(suggestionsArray.count, 5)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 5)
    }
    func testGetInitialSearch() {
        XCTAssertEqual(sut.getInitialSearch(), "the verve")
    }
    func testGetLocalTracks() {
        XCTAssertEqual(sut.getLocalTracks(), [trackViewModel])
    }
}
