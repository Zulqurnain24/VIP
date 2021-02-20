//
//  SearchListProtocols.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import Foundation

// View / Presenter
protocol SearchListViewInjection: class {
    func showProgress(_ show: Bool, status: String)
    func showProgress(_ show: Bool)
    func showMessageWith(title: String, message: String, actionTitle: String)
    func loadTracks(_ viewModels: [TrackViewModel], fromBeginning: Bool)
    func loadSuggestions(_ suggestions: [SuggestionViewModel])
    func changeCollectionViewLayout()
}

protocol SearchListPresenterDelegate: class {
    func viewDidLoad()
    func searchTrack(_ search: String?)
    func trackSelectedAt(_ index: Int)
    func getSuggestions()
    func suggestionSelectedAt(_ index: Int)
    func sortTracksBy(_ type: SortType)
    func changeLayout()
}

// Presenter / Interactor

typealias TracksGetTracksCompletionBlock = (_ viewModel: [TrackViewModel]?, _ success: Bool, _ error: ResultError?) -> Void
typealias GetSuggestionsCompletionBlock = ([SuggestionViewModel]) -> Void

protocol SearchListInteractorDelegate: class {
    func getTracksList(search: String?, completion: @escaping TracksGetTracksCompletionBlock)
    func clear()
    func getTrackSelectedAt(_ index: Int) -> TrackViewModel?
    func getAllSuggestions(completion: @escaping GetSuggestionsCompletionBlock)
    func getSuggestionAt(index: Int) -> SuggestionViewModel?
    func getInitialSearch() -> String
    func sortTracksBy(_ sortType: SortType)
    func getLocalTracks() -> [TrackViewModel]
}

// Presenter / Router
protocol SearchListRouterDelegate: class {
    func showTrackDetail(_ track: TrackViewModel, allTracks: [TrackViewModel])
}
