//
//  GeneralMessagePresenterTest.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class GeneralMessagePresenterTest: XCTestCase {
    var sut: GeneralMessagePresenter!
    let generalMessageType = GeneralMessageType.NoInternetConnection
    override func setUp() {
        super.setUp()
        let generalMessageVC = GeneralMessageViewController()

        sut = GeneralMessagePresenter(view: generalMessageVC, type: generalMessageType)
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func testDI() {
        XCTAssertNotNil(sut.type)
    }
    func testType() {
        XCTAssertEqual(sut.type, GeneralMessageType.NoInternetConnection)
    }

}
