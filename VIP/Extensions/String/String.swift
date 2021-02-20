//
//  String.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import Foundation

extension String {

    public func replacingFirstOccurrence(of string: String, with replacement: String) -> String {
        guard let range = self.range(of: string) else { return self }
        return replacingCharacters(in: range, with: replacement)
    }

}
