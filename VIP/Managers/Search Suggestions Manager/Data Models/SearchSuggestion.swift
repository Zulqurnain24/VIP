//
//  SearchSuggestion.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import Foundation
import RealmSwift

class SearchSuggestion: Object {

    @objc dynamic var suggestionId: String?
    @objc dynamic var suggestion: String = ""
    @objc dynamic var timestamp: TimeInterval = NSDate().timeIntervalSince1970

    override class func primaryKey() -> String? {
        return "suggestionId"
    }

}
