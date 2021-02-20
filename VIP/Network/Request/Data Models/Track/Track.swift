//
//  Track.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//
import Foundation

public struct TracksResponse: Decodable {

    let resultCount: UInt
    let results: [TrackResponse]

}

public struct TrackResponse: Decodable {

    let artistName: String
    let trackId: Int
    let trackName: String
    let trackViewUrl: String
    let previewUrl: String?
    let artworkUrl100: String
    let releaseDate: String
    let primaryGenreName: String
    let trackPrice: Float?
    let currency: String
    let trackTimeMillis: Int?
    let collectionName: String?

}

extension TrackResponse: Equatable {
    public static func == (lhs: TrackResponse, rhs: TrackResponse) -> Bool {
        return  lhs.artistName ==  rhs.artistName
                &&
                lhs.trackId ==  rhs.trackId
                &&
                lhs.trackName ==  rhs.trackName
                &&
                lhs.trackViewUrl ==  rhs.trackViewUrl
                &&
                lhs.previewUrl ==  rhs.previewUrl
                &&
                lhs.artworkUrl100 ==  rhs.artworkUrl100
                &&
                lhs.releaseDate ==  rhs.releaseDate
                &&
                lhs.primaryGenreName ==  rhs.primaryGenreName
                &&
                lhs.trackPrice ==  rhs.trackPrice
                &&
                lhs.currency ==  rhs.currency
                &&
                lhs.trackTimeMillis ==  rhs.trackTimeMillis
                &&
                lhs.collectionName ==  rhs.collectionName
    }
}
