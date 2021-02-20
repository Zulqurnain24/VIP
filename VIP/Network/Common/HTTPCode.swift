//
//  HTTPCode.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import Foundation

struct HTTPCode {
    let intValue: Int

    /// Informational - Request received, continuing process.
    public var isInformational: Bool {
        return isIn(range: 100...199)
    }
    /// Success - The action was successfully received, understood, and accepted.
    public var isSuccess: Bool {
        return isIn(range: 200...299)
    }
    /// Redirection - Further action must be taken in order to complete the request.
    public var isRedirection: Bool {
        return isIn(range: 300...399)
    }
    /// Client Error - The request contains bad syntax or cannot be fulfilled.
    public var isClientError: Bool {
        return isIn(range: 400...499)
    }
    /// Session Error - The session has expired. A new session must be created.
    public var isSessionError: Bool {
        return isIn(range: 410...410)
    }
    /// Server Error - The server failed to fulfill an apparently valid request.
    public var isServerError: Bool {
        return isIn(range: 500...599)
    }
}

fileprivate extension HTTPCode {
    private func isIn(range: ClosedRange<Int>) -> Bool {
        return range.contains(intValue)
    }
}

extension HTTPCode: Equatable {
    public static func == (lhs: HTTPCode, rhs: HTTPCode) -> Bool {
        return lhs.intValue == rhs.intValue
               &&
               lhs.isInformational == rhs.isInformational
               &&
               lhs.isSuccess == rhs.isSuccess
               &&
               lhs.isRedirection == rhs.isRedirection
               &&
               lhs.isClientError == rhs.isClientError
               &&
               lhs.isSessionError == rhs.isSessionError
               &&
               lhs.isServerError == rhs.isServerError
    }
}
