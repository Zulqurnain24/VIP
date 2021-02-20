//
//  SearchListInteractor.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import Foundation

typealias GetArtistsCompletionBlock = (Result<TracksResponse?>) -> Void

class SearchListInteractor {

    internal let requestManager: RequestManager
    internal var tracksViewModel: [TrackViewModel]
    internal var suggestions: [SuggestionViewModel]

    // MARK: - Lifecycle
    convenience init() {
        self.init(requestManager: RequestManager(), tracksViewModel: [TrackViewModel](), suggestions: [SuggestionViewModel]())
    }

    init(requestManager: RequestManager, tracksViewModel: [TrackViewModel], suggestions: [SuggestionViewModel]) {
        self.requestManager = requestManager
        self.tracksViewModel = tracksViewModel
        self.suggestions = suggestions
    }

}

// MARK: - Private section
extension SearchListInteractor {

    /**
     * Get tracks
     *
     * - parameters:
     *      -search: the search term for tracks
     *      -simulatedJSONFile: boolean to determinate if we need to load the info using a local json file
     *      -completion: completion block
     */
    private func getTracks(search: String? = nil, simulatedJSONFile: String? = nil, completion: @escaping GetArtistsCompletionBlock) {
        var tracksRequest = TracksRequest(search: search)

        tracksRequest.completion = completion
        tracksRequest.simulatedResponseJSONFile = simulatedJSONFile
        requestManager.send(request: tracksRequest)
    }

    /**
     * Update tracks results
     *
     * - parameters:
     *      -tracks: tracks array with the response
     */
    private func updateTracksWith(_ tracks: [TrackResponse]) {
        let tracksViewModel = TrackViewModel.getViewModelsWith(tracks)
        self.tracksViewModel.append(contentsOf: tracksViewModel)
    }

    /**
     * Save search (in order to add a new suggestion)
     *
     * - parameters:
     *      -search: the search term
     */
    private func saveSearch(_ search: String?) {
        guard let search = search else { return }
        SearchSuggestionsManager.shared.saveSuggestion(search)
    }

    /**
     * Get random search (for the first app running)
     */
    private func getRandomSearch() -> String {
        let searchArray = ["The Beatles", "Oasis", "Blur", "The Verve"]
        guard let randomSearch = searchArray.randomElement() else {
            return "The Beatles"
        }

        return randomSearch
    }

}

// MARK: - SearchListInteractorDelegate
extension SearchListInteractor: SearchListInteractorDelegate {

    /**
     * Get tracks list
     *
     * - parameters:
     *      -search: the search term for tracks
     *      -completion: completion block
     */
    func getTracksList(search: String?, completion: @escaping TracksGetTracksCompletionBlock) {
        getTracks(search: search) { [weak self] (response) in
            guard let `self` = self else { return }

            switch response {
            case .success(let response):
                guard let response = response else {
                    completion(nil, false, nil)
                    return
                }

                self.updateTracksWith(response.results)
                if !response.results.isEmpty {
                    self.saveSearch(search)
                }
                completion(self.tracksViewModel, true, nil)
            case .failure(let error):
                completion(nil, false, error)
            }
        }
    }

    /**
     * Clear current tracks information (reset)
     */
    func clear() {
        tracksViewModel = []
    }

    /**
     * Get track view model selected at section / index
     *
     * - parameters:
     *      -section: the selected section
     *      -index: the selected index
     */
    func getTrackSelectedAt(_ index: Int) -> TrackViewModel? {
        if !tracksViewModel.indices.contains(index) { return nil }

        return tracksViewModel[index]
    }

    /**
     * Get all suggestions
     *
     * - parameters:
     *      -completion: the completion block
     */
    func getAllSuggestions(completion: @escaping GetSuggestionsCompletionBlock) {
        let allSuggestions = SearchSuggestionsManager.shared.getSuggestions()
        suggestions = SuggestionViewModel.getViewModelsWith(suggestions: allSuggestions)
        completion(suggestions)
    }

    /**
     * Get suggestion view model at index
     *
     * - parameters:
     *      -index: the selected index
     */
    func getSuggestionAt(index: Int) -> SuggestionViewModel? {
        if !suggestions.indices.contains(index) { return nil }

        return suggestions[index]
    }

    /**
     * Get the initial search term (for the initial app running)
     */
    func getInitialSearch() -> String {
        // __ if we don't have suggestions -> get a random search term
        guard let lastSuggestion = SearchSuggestionsManager.shared.getLastSuggestion() else {
            return getRandomSearch()
        }

        // __ otherwise -> get the mos recent search term
        return lastSuggestion.suggestion
    }

    func sortTracksBy(_ sortType: SortType) {
        switch sortType {
        case .artistName:
            tracksViewModel = tracksViewModel.sorted(by: { $0.artistName < $1.artistName })
        case .genre:
            tracksViewModel = tracksViewModel.sorted(by: { $0.primaryGenreName < $1.primaryGenreName })
        case .length:
            tracksViewModel = tracksViewModel.sorted(by: { $0.trackDuration < $1.trackDuration })
        case .price:
            tracksViewModel = tracksViewModel.sorted(by: { $0.trackPrice ?? "" < $1.trackPrice ?? "" })
        }
    }

    func getLocalTracks() -> [TrackViewModel] {
        return tracksViewModel
    }

}
