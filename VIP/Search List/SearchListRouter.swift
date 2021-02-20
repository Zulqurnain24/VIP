//
//  SearchListRouter.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import Foundation

class SearchListRouter {

    internal weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }

    /**
     * Setup the initial module
     */
    public static func setupModule() -> UINavigationController {
        let searchListVC = SearchListViewController()
        let searchListNVC = UINavigationController(rootViewController: searchListVC)
        searchListVC.presenter = SearchListPresenter(view: searchListVC, navigationController: searchListNVC)
        return searchListNVC
    }

}

// MARK: - SearchListRouterDelegate
extension SearchListRouter: SearchListRouterDelegate {

    func showTrackDetail(_ track: TrackViewModel, allTracks: [TrackViewModel]) {
        let trackDetailVC = TrackDetailRouter.setupModuleWithCurrentTrack(track, allTracks: allTracks, navigationController: navigationController)
        navigationController?.pushViewController(trackDetailVC, animated: true)
    }

}
