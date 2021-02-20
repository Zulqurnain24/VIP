//
//  GeneralMessagePresenter.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import Foundation

/**
 * Enum to manage all the possible messages types
 * For now I'm using only NoInternetConnection type but it's possible to extend this in the future
 */
enum GeneralMessageType {
    case NoInternetConnection
}

class GeneralMessagePresenter {

    internal weak var view: GeneralMessageViewInjection?
    internal let type: GeneralMessageType

    // MARK: - Lifecycle
    init(view: GeneralMessageViewInjection, type: GeneralMessageType) {
        self.view = view
        self.type = type
    }

}

extension GeneralMessagePresenter: GeneralMessagePresenterDelegate {

    /**
     * View did appear
     */
    func viewDidAppear() {
        switch type {
        case .NoInternetConnection:
            view?.load(title: "Without connection to the network.", message: "VIP needs to connect to the internet.\nCheck the connections and try again.")
            break
        }
    }

}
