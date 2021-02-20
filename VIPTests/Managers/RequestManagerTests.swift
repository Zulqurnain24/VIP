//
//  Network.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

typealias TracksCompletionBlock = (Result<TracksResponse?>) -> Void

class RequestManagerTests: XCTestCase {

    private let sut = RequestManager()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testTracksResultsWith(search: String? = nil,
                               simulatedJSONFile: String? = nil,
                               completion: @escaping TracksCompletionBlock) {
        var tracksRequest = TracksRequest(search: search)

        tracksRequest.completion = completion
        tracksRequest.simulatedResponseJSONFile = simulatedJSONFile
        tracksRequest.verbose = true
        sut.send(request: tracksRequest)
    }

    func testTracksResults() {
        let tracksResultsExpectation: XCTestExpectation = self.expectation(description: "tracksResultsExpectation")

        testTracksResultsWith(search: "Noel Gallagher") { (response) in
            switch response {
            case .success(let response):
                guard let response = response else {
                    XCTFail("Impossible to get the response")
                    return
                }
                XCTAssert(!response.results.isEmpty, "data array can't be empty")
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }

            tracksResultsExpectation.fulfill()
        }

        self.waitForExpectations(timeout: 25.0, handler: nil)
    }

    func testSimulatedTracksResults() {
        let tracksResultsExpectation: XCTestExpectation = self.expectation(description: "tracksResultsExpectation")

        testTracksResultsWith(search: "beatles", simulatedJSONFile: "Tracks") { (response) in
            switch response {
            case .success(let response):
                guard let response = response else {
                    XCTFail("Impossible to get the response")
                    return
                }
                XCTAssert(!response.results.isEmpty, "data array can't be empty")
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }

            tracksResultsExpectation.fulfill()
        }

        self.waitForExpectations(timeout: 25.0, handler: nil)
    }

}
