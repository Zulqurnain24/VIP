//
//  NetworkHeaders.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import Foundation

final class NetworkHeaders {

    internal enum Keys {
        internal static let authorizationKey = "Authorization"
    }

    static func create() -> [AnyHashable: Any] {

        let headers: [AnyHashable: Any] = [:]
        return headers

    }
}
