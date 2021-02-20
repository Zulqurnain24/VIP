//
//  SearchListPresenterTest.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class SearchListPresenterTests: XCTestCase {
    var sut: SearchListPresenter!
    override func setUp() {
        super.setUp()
        let searchListVC = SearchListViewController()
        let searchListNVC = UINavigationController(rootViewController: searchListVC)
        sut = SearchListPresenter(view: searchListVC, navigationController: searchListNVC)
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func testDI() {

        XCTAssertNotNil(sut.view)
        XCTAssertNotNil(sut.interactor)
        XCTAssertNotNil(sut.router)
        XCTAssertNotNil(sut.sortType)
    }
}
