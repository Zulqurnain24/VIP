//
//  CustomTitleViewTest.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class CustomTitleViewTest: XCTestCase {
    var sut: CustomTitleView!
    override func setUp() {
        super.setUp()
        sut = CustomTitleView()
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func testInit() {
        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.contentStackView)
        XCTAssertNotNil(sut.titleLabel)
        XCTAssertNotNil(sut.subtitleLabel)
        sut.setTitle("view")
        XCTAssertEqual(sut.titleLabel.text, "view")
        sut.setSubtitle("subView")
        XCTAssertEqual(sut.subtitleLabel.text, "subView")
        XCTAssertEqual(sut.contentStackView.axis, .vertical)
        XCTAssertEqual(sut.contentStackView.alignment, .center)
        XCTAssertEqual(sut.contentStackView.distribution, .fill)
        XCTAssertEqual(sut.contentStackView.spacing, 5)
        XCTAssertEqual(sut.backgroundColor, .clear)
        XCTAssertEqual(sut.titleLabel.font, UIFont.mediumWithSize(size: 15.0))
        XCTAssertEqual(sut.titleLabel.textColor, .white)
        XCTAssertEqual(sut.subtitleLabel.font, UIFont.mediumWithSize(size: 13.0))
        XCTAssertEqual(sut.subtitleLabel.font, UIFont.mediumWithSize(size: 13.0))
        XCTAssertEqual(sut.contentStackView.translatesAutoresizingMaskIntoConstraints, false)
        XCTAssertEqual(sut.contentStackView.translatesAutoresizingMaskIntoConstraints, false)
    }
}
