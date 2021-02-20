//
//  TrackDetailRouter.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import Foundation
import SafariServices

class TrackDetailRouter {

    internal weak var navigationController: UINavigationController?

    // MARK: - Lifecycle
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }

    /**
     * Setup the initial module
     */
    public static func setupModuleWithCurrentTrack(_ track: TrackViewModel, allTracks: [TrackViewModel], navigationController: UINavigationController?) -> TrackDetailViewController {
        let trackDetailVC = TrackDetailViewController()
        trackDetailVC.presenter = TrackDetailPresenter(view: trackDetailVC, track: track, allTracks: allTracks, navigationController: navigationController)
        return trackDetailVC
    }

}
