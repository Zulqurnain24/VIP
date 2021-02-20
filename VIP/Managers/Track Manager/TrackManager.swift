//
//  TrackManager.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import Foundation

enum ImageType {
    case small
    case medium
    case large
}

class TrackManager {

    static let shared: TrackManager = { return TrackManager() }()

    /**
     * Internal struct for url
     */
    private struct Constants {

        struct ImageSize {
            static let small: String = "30x30"
            static let medium: String = "60x60"
            static let large: String = "100x100"
            static let extraLarge: String = "200x200"
        }

    }

    public func getExtraLargeUrlWith(_ originalUrl: URL?, type: ImageType) -> URL? {
        guard let originalUrl = originalUrl else {
            return nil
        }

        var urlString = originalUrl.absoluteString
        switch type {
        case .small:
            urlString = urlString
                        .replacingFirstOccurrence(of:
                        Constants.ImageSize.small,
                        with: Constants.ImageSize.extraLarge)
        case .medium:
            urlString = urlString
                        .replacingFirstOccurrence(of:
                        Constants.ImageSize.medium,
                        with: Constants.ImageSize.extraLarge)
        case .large:
            urlString = urlString
                        .replacingFirstOccurrence(of:
                        Constants.ImageSize.large,
                        with: Constants.ImageSize.extraLarge)
        }

        return URL(string: urlString)
    }

    public func getTrackTimemmssFormatWith(trackTimeMillis: Int?) -> String {
        guard let trackTimeMillis = trackTimeMillis else {
            return ""
        }
        return trackTimeMillis.msToSeconds.minuteSecond
    }

}
