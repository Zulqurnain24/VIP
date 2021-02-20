//
//  TrackDetailViewControllerTest.swift
//  VIPTests
//
//  Created by Zulqurnain on 20/02/2021.
//

import XCTest
@testable import VIP

class TrackDetailViewControllerTest: XCTestCase {
    var sut: TrackDetailViewController!
    override func setUp() {
        super.setUp()
        sut = TrackDetailViewController()
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
        XCTAssertNotNil(sut.shareView)
        XCTAssertNotNil(sut.artworkImageView)
        XCTAssertNotNil(sut.trackNameLabel)
        XCTAssertNotNil(sut.artistNameLabel)
        XCTAssertNotNil(sut.trackDuration)
        XCTAssertNotNil(sut.playerControls)
        XCTAssertEqual(sut.view.backgroundColor, .black)
        XCTAssertEqual(sut.edgesForExtendedLayout, [])
        XCTAssertEqual(sut.artworkImageView.frame, CGRect(x: 0.0, y: 0.0, width: 250.0, height: 250.0))
        XCTAssertEqual(sut.trackNameLabel.font, UIFont.mediumWithSize(size: 18.0))
        XCTAssertEqual(sut.trackNameLabel.textColor, .white)
        XCTAssertEqual(sut.trackNameLabel.textAlignment, .center)
        XCTAssertEqual(sut.artistNameLabel.font, UIFont.mediumWithSize(size: 16.0))
        XCTAssertEqual(sut.artistNameLabel.textColor, .lightGray)
        XCTAssertEqual(sut.artistNameLabel.textAlignment, .center)
        XCTAssertEqual(TrackDetailViewController.Layout.ArtworkImageView.height, 250.0)
        XCTAssertEqual(TrackDetailViewController.Layout.ArtworkImageView.width, 250.0)
        XCTAssertEqual(TrackDetailViewController.Layout.ArtworkImageView.top, 10.0)
        XCTAssertEqual(TrackDetailViewController.Layout.TrackNameLabel.leading, 16.0)
        XCTAssertEqual(TrackDetailViewController.Layout.TrackNameLabel.trailing, 16.0)
        XCTAssertEqual(TrackDetailViewController.Layout.TrackNameLabel.top, 10.0)
        XCTAssertEqual(TrackDetailViewController.Layout.TrackNameLabel.height, 21.0)
        XCTAssertEqual(TrackDetailViewController.Layout.ArtistNameLabel.leading, 16.0)
        XCTAssertEqual(TrackDetailViewController.Layout.ArtistNameLabel.trailing, 16.0)
        XCTAssertEqual(TrackDetailViewController.Layout.ArtistNameLabel.top, 10.0)
        XCTAssertEqual(TrackDetailViewController.Layout.ArtistNameLabel.height, 21.0)
        XCTAssertEqual(TrackDetailViewController.Layout.TrackDuration.top, 10.0)
        XCTAssertEqual(TrackDetailViewController.Layout.PlayerControls.top, 10.0)
    }
}
