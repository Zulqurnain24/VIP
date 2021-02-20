//
//  ShareManager.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import Foundation

class ShareManager {

    static let shared: ShareManager = { return ShareManager() }()

    public var defaultShareMessage: String?

    public func setup(defaultShareMessage: String) {
        self.defaultShareMessage = defaultShareMessage
    }

    public func getDetaultShareMessage() -> String {
        guard let defaultShareMessage = defaultShareMessage else {
            return ""
        }

        return defaultShareMessage
    }

    public func share(_ items: [Any], from: UIViewController) {
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        from.present(ac, animated: true)
    }

}
