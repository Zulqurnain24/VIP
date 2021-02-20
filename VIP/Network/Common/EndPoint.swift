//
//  EndPoint.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import UIKit

protocol EndpointProtocol: RawRepresentable where RawValue == String {
    var url: URL? { get }
}

/**
 * Internal struct for Url
 */
internal struct Constants {

    static let baseUrl: String = "https://itunes.apple.com/search"

    struct Fields {
        static let term: String = "term"
        static let media: String = "media"
        static let entity: String = "entity"
        static let attribute: String = "attribute"
        static let limit: String = "limit"
    }

    struct Parameters {
        static let limit: UInt = 200
        static let music: String = "music"
    }

}

// MARK: - Endpoints
enum Endpoint: EndpointProtocol {

    var rawValue: String {
        switch self {
        case .getArtistWith(let search):
            var tokens = search?.split(separator: ",")
            let searchTerm = tokens?.first
            var endpoint = "?"

            if let search = searchTerm,
               let searchWithUrlFormat =
                   search.addingPercentEncoding(withAllowedCharacters:
                                                CharacterSet.urlQueryAllowed) {
                endpoint = "\(endpoint)\(Constants.Fields.term)=\(searchWithUrlFormat)"
            }

            if !(tokens?.isEmpty ?? true) {tokens?.remove(at: 0)}
            tokens?.forEach({ token in
                endpoint += "&entity=\(token)"
            })

            return endpoint
        }
    }

    case getArtistWith(search: String?)

}

extension EndpointProtocol {

    init?(rawValue: String) {
        assertionFailure("init(rawValue:) not implemented")
        return nil
    }

    var url: URL? {
        let urlComponents = URLComponents(string: Constants.baseUrl + self.rawValue)
        return urlComponents?.url
    }

}
