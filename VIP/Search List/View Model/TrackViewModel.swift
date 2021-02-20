//
//  TrackViewModel.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import Foundation

struct TrackViewModel {

    let trackId: Int
    let artistName: String
    let trackName: String
    let artworkUrl: URL?
    let releaseDate: String
    let releaseYear: String
    let previewUrl: URL?
    let primaryGenreName: String
    let trackViewUrl: URL?
    let trackDuration: String
    let trackPrice: String?
    let collectionName: String?

    init(trackId: Int, artistName: String, trackName: String,
         artworkUrl: URL?, releaseDate: String, releaseYear: String,
         previewUrl: URL?, primaryGenreName: String, trackViewUrl: URL?,
         trackDuration: String, trackPrice: String?, collectionName: String?) {
        self.trackId = trackId
        self.artistName = artistName
        self.trackName = trackName
        self.artworkUrl = artworkUrl
        self.releaseDate = releaseDate
        self.releaseYear = releaseYear
        self.previewUrl = previewUrl
        self.primaryGenreName = primaryGenreName
        self.trackViewUrl = trackViewUrl
        self.trackDuration = trackDuration
        self.trackPrice = trackPrice
        self.collectionName = collectionName
    }

}

extension TrackViewModel {

    /**
     * Get the view models (array) from the tracks response array
     *
     * - parameters:
     *      -trackResponse: the tracks response array
     */
    public static func getViewModelsWith(_ trackResponse: [TrackResponse]) -> [TrackViewModel] {
        return trackResponse.map { getViewModelWith($0) }
    }

    /**
     * Get the view model (single view model) from the track response
     *
     * - parameters:
     *      -trackResponse: the track response
     */
    private static func getViewModelWith(_ trackResponse: TrackResponse) -> TrackViewModel {
        let artworkUrl = TrackManager.shared.getExtraLargeUrlWith(URL(string: trackResponse.artworkUrl100), type: .large)
        var releaseYear = ""
        var date = ""
        if let releaseDate = Date.getISODateWithString(trackResponse.releaseDate) {
            releaseYear = releaseDate.getStringyyyyFormat()
            date = releaseDate.getStringMMMddyyyyFormat()
        }

        var previewUrl: URL?
        if let url = trackResponse.previewUrl {
            previewUrl = URL(string: url)
        }

        let trackViewUrl = URL(string: trackResponse.trackViewUrl)

        let trackDuration = TrackManager.shared.getTrackTimemmssFormatWith(trackTimeMillis: trackResponse.trackTimeMillis)

        var trackPrice: String?
        if let price = trackResponse.trackPrice, price > 0.0 {
            trackPrice = "\(price) \(trackResponse.currency)"
        }

        return TrackViewModel(trackId: trackResponse.trackId,
                              artistName: trackResponse.artistName,
                              trackName: trackResponse.trackName,
                              artworkUrl: artworkUrl, releaseDate: date,
                              releaseYear: releaseYear, previewUrl: previewUrl,
                              primaryGenreName: trackResponse.primaryGenreName,
                              trackViewUrl: trackViewUrl, trackDuration: trackDuration,
                              trackPrice: trackPrice, collectionName: trackResponse.collectionName)
    }

}

extension TrackViewModel: Equatable {
    static func == (lhs: TrackViewModel, rhs: TrackViewModel) -> Bool {
        return  lhs.trackId ==  rhs.trackId
                &&
                lhs.artistName ==  rhs.artistName
                &&
                lhs.trackName ==  rhs.trackName
                &&
                lhs.artworkUrl ==  rhs.artworkUrl
                &&
                lhs.releaseYear ==  rhs.releaseYear
                &&
                lhs.primaryGenreName ==  rhs.primaryGenreName
                &&
                lhs.trackViewUrl ==  rhs.trackViewUrl
                &&
                lhs.trackPrice ==  rhs.trackPrice
    }
}
