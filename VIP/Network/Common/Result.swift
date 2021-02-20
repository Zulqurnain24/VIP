//
//  Result.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(ResultError)
}
