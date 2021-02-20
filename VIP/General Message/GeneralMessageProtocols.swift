//
//  GeneralMessageProtocols.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import Foundation

// View / Presenter
protocol GeneralMessageViewInjection: class {
    func load(title: String, message: String)
}

protocol GeneralMessagePresenterDelegate: class {
    func viewDidAppear()
}
