//
//  UIEdgeInsets.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import Foundation

extension UIEdgeInsets {

    static var safeAreaInsets: UIEdgeInsets = {
        guard let window = (UIApplication.shared.delegate as? AppDelegate)?.window else { return UIEdgeInsets.zero }
        let insets: UIEdgeInsets
        if #available(iOS 11.0, *) {
            insets = window.safeAreaInsets
        } else {
            insets = UIEdgeInsets.zero
        }
        return insets
    }()

}
