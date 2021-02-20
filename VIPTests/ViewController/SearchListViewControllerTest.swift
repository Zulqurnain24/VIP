//
//  SearchListViewControllerView.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class SearchListViewControllerTest: XCTestCase {
    var sut: SearchListViewController!
    override func setUp() {
        super.setUp()
        sut = SearchListViewController()
        sut.loadView()
        sut.viewDidLoad()
        sut.viewWillAppear(true)
        sut.viewDidAppear(true)
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func testInit() {
        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.customTitleView)
        XCTAssertNotNil(sut.searchView)
        XCTAssertNotNil(sut.sortButton)
        XCTAssertNotNil(sut.noResultsLabel)
        XCTAssertNotNil(sut.categoriesButton)
        XCTAssertNotNil(sut.searchListContainerView)
        XCTAssertNotNil(sut.listLayout)
        XCTAssertNotNil(sut.gridLayout)
        XCTAssertNotNil(sut.layoutState)
        XCTAssertNotNil(sut.animationDuration)
        XCTAssertNotNil(sut.suggestionsView)
        XCTAssertNotNil(sut.isListView)
        XCTAssertNotNil(sut.numberOfCellsInARow)
        XCTAssertNotNil(sut.isFirstTime)
        XCTAssertEqual(sut.animationDuration, 0.5)
        XCTAssertEqual(sut.isListView, false)
        XCTAssertEqual(sut.numberOfCellsInARow, 2)
        XCTAssertEqual(sut.isFirstTime, true)
        XCTAssertEqual(sut.categoryDataArray, ["Album", "Book", "Artist", "Movie", "musicVideo", "Podcast", "Song"])
        XCTAssertEqual(sut.categorySelectedArray, [])
        XCTAssertEqual(sut.cellSelectionStyle, .tickmark)
        XCTAssertEqual(sut.sortButton.titleLabel?.text, "Options")
        XCTAssertEqual(sut.sortButton.titleLabel?.font, UIFont.mediumWithSize(size: 15.0))
        XCTAssertEqual(sut.sortButton.titleLabel?.textColor, .white)
        XCTAssertEqual(sut.suggestionsView.isHidden, true)
        XCTAssertEqual(sut.categoriesButton.titleLabel?.font, UIFont(name: "Helvetica Neue", size: 12))
        XCTAssertEqual(sut.categoriesButton.currentTitleColor,.white)
        XCTAssertEqual(sut.categoriesButton.isHidden, false)
        XCTAssertEqual(sut.noResultsLabel.font, UIFont.mediumWithSize(size: 14.0))
        XCTAssertEqual(sut.noResultsLabel.textColor, .white)
        XCTAssertEqual(sut.noResultsLabel.text, "No results. Please try again")
        XCTAssertEqual(sut.noResultsLabel.textAlignment, .center)
        XCTAssertEqual(sut.noResultsLabel.isHidden, true)
        XCTAssertEqual(sut.searchListCollectionView?.backgroundColor, .clear)
        XCTAssertEqual(sut.searchListCollectionView?.isUserInteractionEnabled, true)
        XCTAssertEqual(sut.searchListCollectionView?.showsVerticalScrollIndicator, false)
        XCTAssertEqual(sut.customTitleView.titleLabel.text, "VIP")
        XCTAssertEqual(sut.getTrackCellSide(), 245.25)
    }
}
