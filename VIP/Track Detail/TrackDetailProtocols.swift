//
//  TrackDetailProtocols.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import Foundation

// View / Presenter
protocol TrackDetailViewInjection: class {
    func loadTrack(_ track: TrackViewModel)
    func loadTotalDuration(_ totalDuration: Double)
    func loadCurrentTime(_ currentTime: Int)
}

protocol TrackDetailPresenterDelegate: class {
    func viewDidLoad()
    func viewDidDisappear()
    func playPressed()
    func pausePressed()
    func nextPressed()
    func prevPressed()
    func sharePressed()
}

// Presenter / Interactor
protocol TrackDetailInteractorDelegate: class {
    func playTrack()
    func pauseTrack()
    func nextTrack()
    func prevTrack()
    func getCurrentTrack() -> TrackViewModel?
}
